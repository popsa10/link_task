import 'dart:ui';

class AppConstants{
  static List<Locale> supportedLocales = [const Locale('ar'), const Locale('en')];
  static Locale fallbackLocale = const Locale('ar');
  static Locale startLocale = const Locale('ar');
  static String appName = "Barber";
  static String userToken = "userToken";
  static String userData = "userData";
  static String isThemeDataDark = "isThemeDataDark";
  static String fontFamily = "Cairo";
}