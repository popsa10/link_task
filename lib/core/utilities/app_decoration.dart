import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/app_cubit/app_cubit.dart';
import 'app_colors.dart';

class AppDecoration{
  static OutlineInputBorder buildOutlineBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: !context.watch<AppCubit>().isDarkTheme() ? BorderSide(
          color: AppColors.borderColor,
        ) : const BorderSide(
          color: Colors.transparent
        )
    );
  }
}