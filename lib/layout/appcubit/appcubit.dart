import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/layout/appcubit/appstate.dart';
import 'package:newapp/modules/business/Business_Screen.dart';
import 'package:newapp/modules/science/Scienc_Screen.dart';
import 'package:newapp/modules/sports/Sports_Screen.dart';
import 'package:newapp/shared/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntiaialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  List<BottomNavigationBarItem> bottomnavigationbaritem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];

  void changeBottomNavigationbar(index) {
    currentindex = index;
    emit(AppChangeScreenModulesState());
  }

  List<dynamic> business = [];

  void getBusinessData() {
    emit(AppGetBusinessLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '7d6a6128a1314057a3f7922a7181653e',
      },
    ).then(
      (value) {
        business = value.data['articles'];
        emit(AppGetBusinessSucessfulState());
      },
    ).catchError(
      (error) {
        print(
          error.toString(),
        );
        emit(
          AppGetBusinessErrorState(
            error.toString(),
          ),
        );
      },
    );
  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(AppGetSportsLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '7d6a6128a1314057a3f7922a7181653e',
      },
    ).then(
      (value) {
        sports = value.data['articles'];
        emit(AppGetSportsSucessfulState());
      },
    ).catchError(
      (error) {
        print(
          error.toString(),
        );
        emit(
          AppGetSportsErrorState(
            error.toString(),
          ),
        );
      },
    );
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(AppGetScienceLoadingState());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '7d6a6128a1314057a3f7922a7181653e',
      },
    ).then(
      (value) {
        science = value.data['articles'];
        emit(AppGetScienceSucessfulState());
      },
    ).catchError(
      (error) {
        print(
          error.toString(),
        );
        emit(
          AppGetScienceErrorState(
            error.toString(),
          ),
        );
      },
    );
  }

  List<dynamic> search = [];

  void getSearchData(String value) {
    emit(AppGetSearchLoadingState());
    search = [];
    DioHelper.getData(
      path: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '7d6a6128a1314057a3f7922a7181653e',
      },
    ).then(
      (value) {
        search = value.data['articles'];
        emit(AppGetSearchSucessfulState());
      },
    ).catchError(
      (error) {
        print(
          error.toString(),
        );
        emit(
          AppGetSearchErrorState(
            error.toString(),
          ),
        );
      },
    );
  }
}
