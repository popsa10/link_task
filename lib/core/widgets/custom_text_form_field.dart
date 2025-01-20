import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/utilities/app_decoration.dart';

import '../utilities/app_colors.dart';

class CustomFormTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final bool isOptional;
  const CustomFormTextField({super.key, required this.hintText, required this.label,  this.isOptional = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
          text: label,style:  TextStyle(fontSize: 16.sp,fontWeight: FontWeight.normal),
          children: isOptional ? [
            TextSpan(
              text: " (اختياري)",
              style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.normal,color: AppColors.greyColor),
            )
          ] : null
        )),
        SizedBox(height: 10.h,),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 17.h,vertical: 16.w),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal
              ),
              border: AppDecoration.buildOutlineBorder(),
              focusedBorder: AppDecoration.buildOutlineBorder(),
              enabledBorder: AppDecoration.buildOutlineBorder(),

          ),
        ),
      ],
    );
  }

}