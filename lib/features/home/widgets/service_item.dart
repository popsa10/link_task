import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/cubit/app_cubit/app_cubit.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/widgets/custom_cached_network_image.dart';
import '../model/service_model.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceModel;
  const ServiceItem({super.key, required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedNetworkImage(imageUrl: serviceModel.image ?? "",width: 181.w,
          height: 146.h,borderRadius: 8.r,),

        SizedBox(height: 8.h,),
        Text(
          serviceModel.name ?? "",
          style:  TextStyle(
            color: context.watch<AppCubit>().isDarkTheme() ? null : AppColors.descColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
