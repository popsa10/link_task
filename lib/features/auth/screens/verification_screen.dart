import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/app_custom_button.dart';
import 'package:link_task/features/auth/widgets/logo_widget.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
   VerificationScreen({super.key});

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: AppColors.primaryColor),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(8),
    ),
  );



  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.primaryColor
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.primaryColor

    );
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(),
              SizedBox(height: 23.h,),
              Center(child: Text("كود التحقق",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600),)),
              SizedBox(height: 38.h,),
               Text.rich(TextSpan(
                children: [
                  const TextSpan(
                    text: "أكتب كود التحقق المرسل الى",
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal)
                  ),
                  const TextSpan(
                    text: "+966 50 268 9874 ",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: "تعديل",
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)
                  ),
                ]
              )),
              SizedBox(height: 32.h,),
              Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            length: 6,
            onCompleted: (pin) => print(pin),
          ),
              SizedBox(height: 16.h,),
              const Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "لم يصلك كود التحقق؟ ",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal)
                    ),
                    TextSpan(
                        text: "58:00",
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
                    ),
                  ]
              )),
              const Spacer(),
              AppCustomButton(title: "تحقق الآن", onTap: () {
                context.navigateTo(AppRoutes.registerRoute);
              },)


            ],
          ),
        ),
      ),
    );
  }
}
