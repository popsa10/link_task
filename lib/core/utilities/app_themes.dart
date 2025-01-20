import 'package:flutter/material.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_constants.dart';
import 'package:pinput/pinput.dart';

class AppThemes{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    fontFamily: AppConstants.fontFamily,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryLightColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.whiteColor,
        endShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(12))
        )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      ),
        actionsIconTheme: IconThemeData(
          color: AppColors.primaryColor,
        )
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.blackColor
      ),
      bodyMedium:  TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
          color: AppColors.blackColor
      ),
      bodyLarge:  TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      ),
    )

  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: false,
    fontFamily: AppConstants.fontFamily,
    primaryColor: AppColors.darkStroke,
    primaryColorLight: AppColors.primaryLightColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.blackColor,
      endShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(12))
      )
    ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.whiteColor
        ),
        bodyMedium:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor
        ),
        bodyLarge:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
        ),
      ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.whiteColor,
      )
    ),




  );

  static PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: AppColors.primaryColor),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}