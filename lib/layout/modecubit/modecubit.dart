import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/layout/modecubit/modestate.dart';
import 'package:newapp/shared/remote/cache_helper.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit() : super(IntialModeState());

  static ModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else
      isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }
}
