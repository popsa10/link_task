import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_task/core/helper/validator_helper.dart';
import 'package:link_task/core/utilities/app_constants.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_images.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../generated/locale_keys.g.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;
  const LoginFormWidget({super.key, required this.phoneController, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.phoneNumber.tr(),
          style:
          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 16.h,
        ),
        Form(
          key: formKey,
          child: CustomFormTextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              return Validator.validatePhone(value);
            },
            hintText: "50xxxxxxx",prefixIcon: SizedBox(
            height: 10.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SvgPicture.asset(
                      AppImages.saudiFlag
                  ),
                ),
                Text(
                  AppConstants.appPhoneKey,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
                  child: VerticalDivider(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),),
        ),
      ],
    );
  }
}
