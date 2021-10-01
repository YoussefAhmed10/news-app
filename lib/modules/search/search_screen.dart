import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/layout/appcubit/appcubit.dart';
import 'package:newapp/layout/appcubit/appstate.dart';
import 'package:newapp/shared/local/Componant.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(
              title: Text('Search'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      AppCubit.get(context).getSearchData(value);
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        Text('search must not be empty');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'search',
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: buildArticleItem(context, list, isSearch: true),
                ),
              ],
            ),
          );
        });
  }
}
