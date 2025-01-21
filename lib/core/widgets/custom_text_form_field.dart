import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:link_task/core/utilities/app_decoration.dart';
import '../../generated/locale_keys.g.dart';
import '../utilities/app_colors.dart';
import 'dart:ui' as ui;

class CustomFormTextField extends StatelessWidget {
  final String hintText;
  final String? label;
  final bool isOptional;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const CustomFormTextField({super.key, required this.hintText, this.label,  this.isOptional = false, this.prefixIcon, required this.controller, this.validator, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null)
        Text.rich(TextSpan(
          text: label,style:  TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
          children: isOptional ? [
            TextSpan(
              text: " (${LocaleKeys.optional.tr()})",
              style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.greyColor),
            )
          ] : null
        )),
        SizedBox(height: 10.h,),
        Directionality(
          textDirection: prefixIcon != null ? ui.TextDirection.ltr : ui.TextDirection.rtl,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
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
