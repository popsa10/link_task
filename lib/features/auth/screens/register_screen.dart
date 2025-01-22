import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/app_custom_button.dart';
import 'package:link_task/core/widgets/custom_loader.dart';
import 'package:link_task/core/widgets/error_snackbar_widget.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_states.dart';
import 'package:link_task/features/auth/model/user_model.dart';
import 'package:link_task/features/auth/widgets/logo_widget.dart';
import 'package:link_task/features/auth/widgets/register_form_widget.dart';
import 'package:link_task/features/auth/widgets/terms_text_widget.dart';

import '../../../generated/locale_keys.g.dart';

class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    // TODO: implement initState
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 30.h),
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
                       RegisterFormWidget(fullNameController: fullNameController, emailController: emailController, formKey: formKey,),
                       SizedBox(height: 10.h,),
                       const TermsTextWidget(),



                    ],
                  ),
                ),
              ),
             BlocConsumer<AuthCubit,AuthState>(builder: (context, state) {
               if(state.isCompleteRegisterLoading){
                 return const CustomLoader();
               }else{
                 return  AppCustomButton(title: LocaleKeys.register.tr(),onTap: (){
                   if(formKey.currentState!.validate()) {
                     context.read<AuthCubit>().register(UserModel(
                     name: fullNameController.text,
                     email: emailController.text,
                   ));
                   }

                 },);
               }
             }, listener: (context, state) {
               if(state.isCompleteRegisterLoaded){
                 context.replaceWith(AppRoutes.homeRoute);
               }
               if(state.isError){
                 showErrorBar(context, state.error?.errorMessage ?? "");
               }
             },)
            ],
          ),
        ),
      ),
    );
  }
}
