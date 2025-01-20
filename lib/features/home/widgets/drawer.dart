import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: Padding(
         padding:  EdgeInsets.symmetric(vertical: 60.h), 
         child: Column(
           children: [
             SvgPicture.asset(AppImages.avatar),
             SizedBox(height: 8.h,),
             const Text(
               'مصطفي محمد',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Color(0xFF002E5B),
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
               ),
             ),
             const Text(
               'Mostafa435@gmail.com',
               style: TextStyle(
                 color: Color(0xFF6C6C6C),
                 fontSize: 10,
                 fontWeight: FontWeight.w400,
               ),
             ),
             SizedBox(height: 16.h,),
              Divider(
               color: AppColors.borderColor,
             ),
             SizedBox(height: 32.h,),
             DrawerItem(
               title: "اللغة",
               icon: AppImages.language,
             ),
             SizedBox(height: 16.h,),
             DrawerItem(
               title: "المظهر",
               icon: AppImages.theme,
             ),
             const Spacer(),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SvgPicture.asset(AppImages.logout),
                 const Text(
                   'تسجيل الخروج',
                   style: TextStyle(
                     color: Color(0xFFDB2524),
                     fontSize: 14,
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
  const DrawerItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: SvgPicture.asset(icon),
      title:  Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing:  Icon(Icons.arrow_back_ios,color: AppColors.primaryColor,),
    );
  }
}

