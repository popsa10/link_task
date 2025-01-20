import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
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

import '../../../generated/locale_keys.g.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoWidget(),
                      SizedBox(height: 25.h,),
                      Center(child: Text(LocaleKeys.register.tr(),style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600),)),
                      SizedBox(height: 32.h,),
                      CustomFormTextField(hintText: LocaleKeys.enterYourFullName.tr(), label: LocaleKeys.fullName.tr()),
                      SizedBox(height: 16.h,),
                       CustomFormTextField(hintText: "${LocaleKeys.enterYourEmail.tr()} (${LocaleKeys.optional.tr()})", label: LocaleKeys.optional.tr(),isOptional: true,),
                      SizedBox(height: 16.h,),
                      Text(LocaleKeys.selectGender.tr(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 11.h,),
                      Row(
                        children: [
                        Expanded(child: Row(children: [
                          Radio(
                            activeColor: AppColors.primaryLightColor,value: true, groupValue: isMale, onChanged: (value) {
                          },),
                           Text(LocaleKeys.male.tr(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                          const Spacer(),
                          Radio(
                            activeColor: AppColors.primaryLightColor,
                            value: false, groupValue: isMale, onChanged: (value) {

                          },),
                           Text(LocaleKeys.female.tr(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                        ],)),
                          const Expanded(child: SizedBox())
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      CustomDropDownFormField(hintText: LocaleKeys.selectYourCity.tr(), label: LocaleKeys.city.tr(), items: [],value: "",),
                      SizedBox(height: 10.h,),
                       Text.rich(TextSpan(
                          text: "${LocaleKeys.whenRegisterYourAccountYouAgreeWith.tr()} ",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),
                          children:  [
                            TextSpan(
                              text: LocaleKeys.termsAndConditions.tr(),
                              style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: context.watch<ThemeCubit>().isDarkTheme() ? null : AppColors.primaryColor),
                            ),
                             TextSpan(
                              text: " ${LocaleKeys.barber.tr()}",
                              style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),
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
