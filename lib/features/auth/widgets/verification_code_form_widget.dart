import 'package:flutter/material.dart';
import 'package:link_task/core/helper/validator_helper.dart';
import 'dart:ui' as ui;

import 'package:pinput/pinput.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_themes.dart';

class VerificationCodeFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController codeController;
  const VerificationCodeFormWidget({super.key, required this.formKey, required this.codeController});

  @override
  Widget build(BuildContext context) {

    return  Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Pinput(
        controller: codeController,
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        validator: (value) {
          return Validator.validateVerificationCode(value);
        },

        defaultPinTheme: AppThemes.defaultPinTheme,
        focusedPinTheme: AppThemes.defaultPinTheme.copyDecorationWith(
            border: Border.all(color: AppColors.primaryColor)),
        submittedPinTheme: AppThemes.defaultPinTheme.copyDecorationWith(
        border: Border.all(color: AppColors.primaryColor)),
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        length: 4,
      ),
    );
  }
}
