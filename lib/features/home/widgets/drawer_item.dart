import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/cubit/theme_cubit/theme_cubit.dart';
import '../../../core/utilities/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  const DrawerItem({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<ThemeCubit>();
    return  ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title:  Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing:  Icon(Icons.arrow_forward_ios_rounded,color: cubit.isDarkTheme() ? AppColors.darkStroke : AppColors.primaryColor,),
    );
  }
}