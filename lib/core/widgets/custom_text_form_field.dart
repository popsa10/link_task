import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:link_task/core/utilities/app_decoration.dart';

import '../utilities/app_colors.dart';

class CustomFormTextField extends StatelessWidget {
  final String hintText;
  final String? label;
  final bool isOptional;
  final Widget? prefixIcon;
  const CustomFormTextField({super.key, required this.hintText, this.label,  this.isOptional = false, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null)
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
        Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 17.h,vertical: 16.w),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: context.watch<ThemeCubit>().isDarkTheme() ? null : AppColors.greyColor ,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal
                ),
                prefixIcon: prefixIcon,
                filled: context.watch<ThemeCubit>().isDarkTheme(),
                fillColor: context.watch<ThemeCubit>().isDarkTheme() ? AppColors.lightBlackColor :null,
                border: AppDecoration.buildOutlineBorder(context),
                focusedBorder: AppDecoration.buildOutlineBorder(context),
                enabledBorder: AppDecoration.buildOutlineBorder(
                  context
                ),

            ),
          ),
        ),
      ],
    );
  }

}
