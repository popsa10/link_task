import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/navigation_extension.dart';

import '../../../core/utilities/app_colors.dart';

class CustomBackWidget extends StatelessWidget {
  const CustomBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        context.pop();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 40.w,
        height: 40.h,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: OvalBorder(),
        ),
        child:  Icon(
          Icons.arrow_back_outlined,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
