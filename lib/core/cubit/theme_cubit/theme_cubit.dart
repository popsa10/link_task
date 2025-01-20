import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/core/services/injector_service.dart';
import 'package:link_task/core/utilities/app_constants.dart';

import 'Theme_states.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialThemeState());

  void toggleTheme() {
    print(cacheService.getData(AppConstants.isThemeDataDark) ?? false);
    if (cacheService.getData(AppConstants.isThemeDataDark) ?? true) {
      cacheService.saveData(AppConstants.isThemeDataDark,false);
    } else {
      cacheService.saveData(AppConstants.isThemeDataDark,true);
    }
    emit(ToggleThemeData());
  }



  bool isDarkTheme() {
    return cacheService.getData(AppConstants.isThemeDataDark) ?? false;
  }
}


