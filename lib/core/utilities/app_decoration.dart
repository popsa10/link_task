import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/cubit/theme_cubit/theme_cubit.dart';

import 'app_colors.dart';

class AppDecoration{
  static OutlineInputBorder buildOutlineBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: !context.watch<ThemeCubit>().isDarkTheme() ? BorderSide(
          color: AppColors.borderColor,
        ) : const BorderSide(
          color: Colors.transparent
        )
    );
  }
}