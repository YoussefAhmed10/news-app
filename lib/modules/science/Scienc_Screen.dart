import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/layout/appcubit/appcubit.dart';
import 'package:newapp/layout/appcubit/appstate.dart';
import 'package:newapp/shared/local/Componant.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = AppCubit.get(context).science;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: buildArticleItem(context, list),
          );
        });
  }
}
