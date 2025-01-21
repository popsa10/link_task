import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_task/features/home/model/provider_model.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_images.dart';
import '../../../core/widgets/custom_cached_network_image.dart';

class SalonWorkerItem extends StatelessWidget {
  final ProviderModel providerModel;
  const SalonWorkerItem({super.key, required this.providerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.lightGreyColor)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedNetworkImage(imageUrl: providerModel.avatar ?? "",width: 94.w,height: 61.h,borderRadius: 4,),
          SizedBox(width: 8.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  providerModel.name ?? "",
                  style:  TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  providerModel.nationality ?? "",
                  style:  TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),


              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.h),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.star,height: 16.h,width: 16.w,),
                SizedBox(width: 4.w,),
                Text(
                  providerModel.rateAvg ??"",
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
