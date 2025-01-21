import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/cubit/theme_cubit/theme_cubit.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_images.dart';
import '../../../generated/locale_keys.g.dart';

class SalonShareWidget extends StatelessWidget {
  const SalonShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:  EdgeInsets.all(11.h),
      margin:  EdgeInsets.symmetric(horizontal: 24.h),
      decoration: ShapeDecoration(
        color:  context.watch<ThemeCubit>().isDarkTheme() ? AppColors.lightBlackColor : const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child:  Row(
        children: [
          Text(
            LocaleKeys.didYouLikeTheSalon.tr(),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: ShapeDecoration(
              color: const Color(0xFF002E5B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              shadows:  context.watch<ThemeCubit>().isDarkTheme() ? null : const [
                BoxShadow(
                  color: Color(0xFFBDC3C7),
                  blurRadius: 5.30,
                  offset: Offset(1, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(

              children: [
                SvgPicture.asset(AppImages.share),
                SizedBox(width: 9.w),
                Text(
                  LocaleKeys.shareWithYourFriends.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
