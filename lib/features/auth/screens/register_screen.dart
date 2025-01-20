import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/app_custom_button.dart';
import 'package:link_task/core/widgets/custom_drop_down_form_field.dart';
import 'package:link_task/core/widgets/custom_text_form_field.dart';
import 'package:link_task/features/auth/widgets/logo_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  final bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoWidget(),
                      SizedBox(height: 25.h,),
                      Center(child: Text("إنشاء حساب",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600),)),
                      SizedBox(height: 32.h,),
                      const CustomFormTextField(hintText: "أدخل اسمك كامل", label: "الأسم كامل"),
                      SizedBox(height: 16.h,),
                      const CustomFormTextField(hintText: "أكتب ايميلك (اختياري)", label: "الأيميل",isOptional: true,),
                      SizedBox(height: 16.h,),
                      const Text("اختيار الجنس",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
                      SizedBox(height: 11.h,),
                      Row(
                        children: [
                        Expanded(child: Row(children: [
                          Radio(
                            activeColor: AppColors.primaryLightColor,value: true, groupValue: isMale, onChanged: (value) {
                          },),
                           Text("ذكر",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal),),
                          const Spacer(),
                          Radio(
                            activeColor: AppColors.primaryLightColor,
                            value: false, groupValue: isMale, onChanged: (value) {

                          },),
                           Text("أنثي",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal),),
                        ],)),
                          const Expanded(child: SizedBox())
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      const CustomDropDownFormField(hintText: "اختار مدينتك", label: "المدينة", items: [],value: "",),
                      SizedBox(height: 10.h,),
                       Text.rich(TextSpan(
                          text: "بإنشاء حسابك أنت توافق على ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                          children:  [
                            TextSpan(
                              text: "شروط وأحكام",
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: context.watch<ThemeCubit>().isDarkTheme() ? null : AppColors.primaryColor),
                            ),
                            const TextSpan(
                              text: " حلاق",
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                            ),

                          ]
                      )),
                    
                  
                  
                    ],
                  ),
                ),
              ),
              AppCustomButton(title: "إنشاء حساب",onTap: (){
                context.navigateTo(AppRoutes.homeRoute);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
