import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/app_custom_button.dart';
import 'package:link_task/core/widgets/custom_phone_text_field.dart';
import 'package:link_task/features/auth/widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(),
              SizedBox(height: 23.h,),
              Center(child: Text("تسجيل الدخول",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600),)),
              SizedBox(height: 48.h,),
              Text("رقم الجوال",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.normal),),
              SizedBox(height: 16.h,),
              const CustomPhoneTextField(),
              SizedBox(height: 36.h,),
               AppCustomButton(title: "تسجيل الدخول",onTap: (){
                context.navigateTo(AppRoutes.verificationRoute);
              },)


            ],
          ),
        ),
      ),
    );
  }
}