import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/cubit/app_cubit/app_cubit.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_constants.dart';
import '../../../core/utilities/app_endpoints.dart';
import '../../../core/utilities/app_images.dart';
import '../../../generated/locale_keys.g.dart';

class SalonShareWidget extends StatelessWidget {
  final int salonId;
  const SalonShareWidget({super.key, required this.salonId});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:  EdgeInsets.all(11.h),
      margin:  EdgeInsets.symmetric(horizontal: 24.h),
      decoration: ShapeDecoration(
        color:  context.watch<AppCubit>().isDarkTheme() ? AppColors.lightBlackColor : const Color(0xFFF9F9F9),
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
          GestureDetector(
            onTap: (){
              Share.share("${AppEndpoints.baseUrl}${AppEndpoints.salonsDetailsEndpoint}/$salonId");
            },
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: ShapeDecoration(
                color:  AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                shadows:  context.watch<AppCubit>().isDarkTheme() ? null : const [
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
            ),
          )
        ],
      ),
    );
  }
}
