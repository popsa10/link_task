import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/cubit/theme_cubit/theme_cubit.dart';
import '../../../core/utilities/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Image.asset(AppImages.logo,width: 174.w,height: 60.h,color: context.watch<ThemeCubit>().isDarkTheme() ? Colors.white : null ,));
  }
}
