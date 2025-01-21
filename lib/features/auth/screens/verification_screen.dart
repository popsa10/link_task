import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_constants.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/app_custom_button.dart';
import 'package:link_task/core/widgets/custom_loader.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_states.dart';
import 'package:link_task/features/auth/widgets/logo_widget.dart';
import 'package:link_task/features/auth/widgets/verification_code_form_widget.dart';

import '../../../core/widgets/error_snackbar_widget.dart';
import '../../../generated/locale_keys.g.dart';
import 'dart:ui' as ui;

import '../widgets/verification_code_resend_timer_widget.dart';


class VerificationScreen extends StatefulWidget {
  final String phoneNumber;
   const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
   late TextEditingController codeController;
   late GlobalKey<FormState> formKey;
   @override
  void initState() {
    // TODO: implement initState
     codeController = TextEditingController();
     formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    codeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(),
              SizedBox(height: 23.h,),
              Center(child: Text(LocaleKeys.verificationCode.tr(),style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600),)),
              SizedBox(height: 38.h,),
              Row(
                children: [
                  Text(LocaleKeys.typeVerificationCodeThatSentTo.tr(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)),
                  Directionality(textDirection: ui.TextDirection.ltr,child: Text(" ${AppConstants.appPhoneKey}${widget.phoneNumber} ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold))),
                  GestureDetector(onTap: (){
                    context.pop();
                  },child: Text(LocaleKeys.edit.tr(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline))),
                ],
              ), 
              SizedBox(height: 32.h,),
               VerificationCodeFormWidget(
                formKey: formKey,
                codeController: codeController,
              ),
              SizedBox(height: 16.h,),
               VerificationCodeResentTimerWidget(
                phoneNumber: widget.phoneNumber,
              ),
              const Spacer(),
            BlocConsumer<AuthCubit,AuthState>(builder: (context, state) {
              if(state.isActiveAccountLoading){
                return const CustomLoader();
              }else{
                return  AppCustomButton(title: LocaleKeys.verifyNow.tr(), onTap: () {
                  context.read<AuthCubit>().activeAccount(widget.phoneNumber, codeController.text);
                },);
              }
            }, listener: (context, state) {
              if(state.isActiveAccountLoaded){
                if(state.isFirstLogin ?? true){
                  context.navigateTo(AppRoutes.registerRoute);
                }else{
                  context.navigateTo(AppRoutes.homeRoute);
                }
              }
              if(state.isError){
                showErrorBar(context, state.error ?? "",);
              }
            },)


            ],
          ),
        ),
      ),
    );
  }
}
