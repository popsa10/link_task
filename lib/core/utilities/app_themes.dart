import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        endShape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(12.r))
        )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      ),
        actionsIconTheme: IconThemeData(
          color: AppColors.primaryColor,
        )
    ),

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
      endShape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(12.r))
      )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 16.sp,
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
    textStyle: TextStyle(fontSize: 20.sp, color: AppColors.primaryColor),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(8.r),
    ),
  );
}