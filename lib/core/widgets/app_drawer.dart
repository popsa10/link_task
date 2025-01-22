import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/services/injector_service.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/custom_cached_network_image.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_states.dart';

import '../../features/home/widgets/drawer_item.dart';
import '../../generated/locale_keys.g.dart';
import '../cubit/app_cubit/app_cubit.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<AppCubit>();
    return Drawer(
      width: 272.w,
       child: Padding(
         padding:  EdgeInsets.symmetric(vertical: 60.h), 
         child: Column(
           children: [
             CustomCachedNetworkImage(width: 116.w,
             height: 116.h,imageUrl: cacheService.loadUserData()?.avatar ?? ""),
             SizedBox(height: 8.h,),
              Text(
               cacheService.loadUserData()?.name ?? "",
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: cubit.isDarkTheme() ? Colors.white : AppColors.primaryColor,
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w500,
               ),
             ),
              if( cacheService.loadUserData()?.email != null)
              Text(
               cacheService.loadUserData()?.email ?? "",
               style: TextStyle(
                 color: cubit.isDarkTheme() ? Colors.white :  AppColors.greyTextColor,
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
               onTap: (){
                 context.read<AppCubit>().toggleLanguage(context); 

               },
               title: LocaleKeys.language.tr(),
               icon: AppImages.language,
             ),

             DrawerItem(
               title: LocaleKeys.theme.tr(),
               onTap: (){
                 context.read<AppCubit>().toggleTheme();
               },
               icon: AppImages.theme,
             ),
             const Spacer(),
             BlocProvider(
               create: (context) => AuthCubit(authRepository),
               child: BlocConsumer<AuthCubit,AuthState>(
                 listener: (context, state) {
                   if(state.isLogoutLoaded){
                     context.replaceWith(AppRoutes.loginRoute);
                   }
                 },
                 builder: (context, state) {
                 return GestureDetector(
                   onTap: (){
                     context.read<AuthCubit>().logout();
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SvgPicture.asset(AppImages.logout),
                       SizedBox(width: 12.w,),
                       Text(
                         LocaleKeys.logout.tr(),
                         style:  TextStyle(
                           color:  AppColors.redColor,
                           fontSize: 14.sp,
                           fontWeight: FontWeight.w600,
                         ),
                       )
                     ],
                   ),
                 );
               },),
             )


           ],
         ),
       ),
    );
  }
}




