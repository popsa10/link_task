
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/core/cubit/app_cubit/app_cubit.dart';
import 'package:link_task/core/utilities/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: CircularProgressIndicator(
      color: context.watch<AppCubit>().isDarkTheme()  ? AppColors.darkStroke : AppColors.primaryColor,
    ));
  }
}
