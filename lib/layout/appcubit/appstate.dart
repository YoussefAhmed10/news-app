abstract class AppStates {}

class AppIntiaialStates extends AppStates {}

class AppChangeScreenModulesState extends AppStates {}

class AppGetBusinessLoadingState extends AppStates {}

class AppGetBusinessSucessfulState extends AppStates {}

class AppGetBusinessErrorState extends AppStates {
  String error;
  AppGetBusinessErrorState(this.error);
}

class AppGetSportsLoadingState extends AppStates {}

class AppGetSportsSucessfulState extends AppStates {}

class AppGetSportsErrorState extends AppStates {
  String error;
  AppGetSportsErrorState(this.error);
}

class AppGetScienceLoadingState extends AppStates {}

class AppGetScienceSucessfulState extends AppStates {}

class AppGetScienceErrorState extends AppStates {
  String error;
  AppGetScienceErrorState(this.error);
}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchSucessfulState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  String error;
  AppGetSearchErrorState(this.error);
}
