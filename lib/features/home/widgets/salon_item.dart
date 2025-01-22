import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/custom_cached_network_image.dart';
import '../../../core/cubit/app_cubit/app_cubit.dart';
import '../../../generated/locale_keys.g.dart';
import '../model/salon_model.dart';

class SalonItem extends StatelessWidget {
  final SalonModel salonModel;
  const SalonItem({super.key, required this.salonModel});

  String services(){
    List<String> services = [];
    for(int i = 0; i < salonModel.services!.length; i++){
      if(i<2){
        services.add(salonModel.services![i].name ?? "");
      }

    }
    return services.join(" - ");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.navigateTo(AppRoutes.salonDetailsRoute,arguments: salonModel.id);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightGreyColor)
        ),
        child: Row(
          children: [
            CustomCachedNetworkImage(imageUrl: AppImages.salonUrl,width: 117.w,height: 101.h,borderRadius: 8,),
            SizedBox(width: 16.w,),
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                   salonModel.name ?? "",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    salonModel.desc ?? "",
                    style: TextStyle(
                      color: context.watch<AppCubit>().isDarkTheme() ? Colors.white : const Color(0xFF263238),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Text(
                    '${LocaleKeys.includesServices.tr()} (${services()})',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 7.5.h,),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.star),
                      SizedBox(width: 4.w,),
                       Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${salonModel.rateAvg ?? 0} ',
                              style: TextStyle(
                                color:  AppColors.greyColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '(${salonModel.countRate ?? 0})',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      SvgPicture.asset(AppImages.location,color: context.watch<AppCubit>().isDarkTheme() ? AppColors.darkStroke : null),
                      SizedBox(width: 4.w,),
                       Text(
                        '${salonModel.distance} ${LocaleKeys.km.tr()}',
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )

                    ],
                  )

                ],
                         ),
             )
          ],
        ),
      ),
    );
  }
}
