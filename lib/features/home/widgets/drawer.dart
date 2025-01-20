import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_task/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';

import '../../../generated/locale_keys.g.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<ThemeCubit>();
    return Drawer(
      width: 272.w,
       child: Padding(
         padding:  EdgeInsets.symmetric(vertical: 60.h), 
         child: Column(
           children: [
             SvgPicture.asset(AppImages.avatar),
             SizedBox(height: 8.h,),
              Text(
               'مصطفي محمد',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: cubit.isDarkTheme() ? Colors.white : const Color(0xFF002E5B),
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w500,
               ),
             ),
              Text(
               'Mostafa435@gmail.com',
               style: TextStyle(
                 color: cubit.isDarkTheme() ? Colors.white : const Color(0xFF6C6C6C),
                 fontSize: 10.sp,
                 fontWeight: FontWeight.w400,
               ),
             ),
             SizedBox(height: 16.h,),
              Divider(
               color: AppColors.borderColor,
             ),
             SizedBox(height: 32.h,),
             DrawerItem(
               onTap: (){},
               title: LocaleKeys.language.tr(),
               icon: AppImages.language,
             ),
             SizedBox(height: 16.h,),
             DrawerItem(
               title: LocaleKeys.theme.tr(),
               onTap: (){
                 context.read<ThemeCubit>().toggleTheme();
               },
               icon: AppImages.theme,
             ),
             const Spacer(),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SvgPicture.asset(AppImages.logout),
                 SizedBox(width: 12.w,),
                  Text(
                   LocaleKeys.logout.tr(),
                   style:  TextStyle(
                     color: const Color(0xFFDB2524),
                     fontSize: 14.sp,
                     fontWeight: FontWeight.w600,
                   ),
                 )
               ],
             )


           ],
         ),
       ),
    );
  }
}


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

