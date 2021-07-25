import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/layout/modecubit/modecubit.dart';
import 'package:newapp/layout/modecubit/modestate.dart';
import 'package:newapp/layout/new_layout_screen.dart';
import 'package:newapp/shared/remote/cache_helper.dart';
import 'package:newapp/shared/remote/dio_helper.dart';
import 'package:newapp/styles/theme.dart';
import 'layout/appcubit/appcubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              ModeCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getBusinessData()
            ..getSportsData()
            ..getScienceData(),
        )
      ],
      child: BlocConsumer<ModeCubit, ModeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //ThemeData For Light
            theme: lightTheme,
            //ThemeData For Dark
            darkTheme: darkTheme,
            themeMode: ModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayoutScreen(),
          );
        },
      ),
    );
  }
}
