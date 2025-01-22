import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/core/services/injector_service.dart';
import 'package:link_task/core/utilities/app_constants.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialThemeState());

  void toggleTheme() {
    if (cacheService.getData(AppConstants.isThemeDataDark) ?? false) {
      cacheService.saveData(AppConstants.isThemeDataDark,false);
    } else {
      cacheService.saveData(AppConstants.isThemeDataDark,true);
    }
    emit(ToggleThemeData());
  }


  void toggleLanguage(BuildContext context) {
    if ((cacheService.getData(AppConstants.userLang) ?? "ar") == "ar") {
      cacheService.saveData(AppConstants.userLang,"en");
      context.setLocale(const Locale("en"));
    } else {
      cacheService.saveData(AppConstants.userLang,"ar");
      context.setLocale(const Locale("ar"));
    }
    emit(ToggleThemeData());
  }


  bool isDarkTheme() {
    return cacheService.getData(AppConstants.isThemeDataDark) ?? false;
  }
}


