import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/utilities/app_themes.dart';
import 'package:link_task/core/widgets/app_custom_button.dart';
import 'package:link_task/features/auth/widgets/logo_widget.dart';
import 'package:pinput/pinput.dart';

import '../../../generated/locale_keys.g.dart';
import 'dart:ui' as ui;

class VerificationScreen extends StatelessWidget {
   const VerificationScreen({super.key});





  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = AppThemes.defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor)
    );

    final submittedPinTheme = AppThemes.defaultPinTheme.copyDecorationWith(
        border: Border.all(color: AppColors.primaryColor)
    );
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(),
              SizedBox(height: 23.h,),
              Center(child: Text(LocaleKeys.verificationCode.tr(),style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600),)),
              SizedBox(height: 38.h,),
               Text.rich(
                   TextSpan(
                children: [
                   TextSpan(
                    text: LocaleKeys.typeVerificationCodeThatSentTo.tr(),
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)
                  ),
                    TextSpan(
                    text: "+966 50 268 9874 ",
                    style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,)
                  ),
                  TextSpan(

                    text: LocaleKeys.edit.tr(),
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)
                  ),
                ]
              )),
              SizedBox(height: 32.h,),
              Directionality(
                textDirection: ui.TextDirection.ltr,
                child: Pinput(
                            defaultPinTheme: AppThemes.defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            length: 6,
                            onCompleted: (pin) => print(pin),
                          ),
              ),
              SizedBox(height: 16.h,),
               Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "${LocaleKeys.didNotGetCode.tr()} ",
                        style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)
                    ),
                     TextSpan(
                        text: "58:00",
                        style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold)
                    ),
                  ]
              )),
              const Spacer(),
              AppCustomButton(title: LocaleKeys.verifyNow.tr(), onTap: () {
                context.navigateTo(AppRoutes.registerRoute);
              },)


            ],
          ),
        ),
      ),
    );
  }
}
