import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_task/core/utilities/app_colors.dart';

import '../../../core/cubit/theme_cubit/theme_cubit.dart';
import '../../../core/utilities/app_images.dart';
import '../../../generated/locale_keys.g.dart';
import '../model/salon_model.dart';

class SalonDetailsHeaderWidget extends StatelessWidget {
  final SalonModel salonModel;
  const SalonDetailsHeaderWidget({super.key, required this.salonModel});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  salonModel.name ?? "",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SvgPicture.asset(AppImages.star),
              SizedBox(width: 4.w,),
              Text(
                salonModel.rateAvg ?? "0",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              )


            ],
          ),
        ),
        SizedBox(height: 14.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Text(
            salonModel.desc ?? "",
            maxLines: 3,
            style: TextStyle(
              color: context.watch<ThemeCubit>().isDarkTheme() ? null: AppColors.descColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 18.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Row(
            children: [
              SvgPicture.asset(AppImages.barber),
              SizedBox(width: 8.w,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${LocaleKeys.numberOfWorkers.tr()}:',
                      style: TextStyle(
                        color: context.watch<ThemeCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.descColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' ${salonModel.providers?.length ?? 0} ${LocaleKeys.specializedBarbers.tr()}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 24.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.h),
          child: Row(
            children: [
              SvgPicture.asset(AppImages.time),
              SizedBox(width: 8.w,),
              Text(
                '${LocaleKeys.workingHours.tr()}: ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: context.watch<ThemeCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.descColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: salonModel.hourWork,
                      style: TextStyle(
                          color: (salonModel.isOpen ?? false) ? AppColors.greenColor : AppColors.redColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline
                      ),
                    ),
                    TextSpan(
                      text: ' - ${(salonModel.isOpen ?? false) ? salonModel.timeClose ?? "" : salonModel.timeOpen ?? ""}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
