import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_routes.dart';
import 'package:link_task/core/widgets/app_custom_button.dart';
import 'package:link_task/core/widgets/custom_loader.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_states.dart';
import 'package:link_task/features/auth/widgets/logo_widget.dart';
import 'package:link_task/generated/locale_keys.g.dart';
import '../../../core/widgets/error_snackbar_widget.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../model/user_model.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formKey;

  late TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            children: [
              const LogoWidget(),
              SizedBox(
                height: 23.h,
              ),
              Text(
                LocaleKeys.login.tr(),
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 48.h,
              ),
              LoginFormWidget(
                phoneController: phoneController,
                formKey: formKey,
              ),
              SizedBox(
                height: 36.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.isError) {
                    showErrorBar(context, state.error ?? "",);
                  }
                  if (state.isLoginLoaded) {
                    context.navigateTo(AppRoutes.verificationRoute,arguments: phoneController.text);
                  }
                },
                builder: (context, state) {
                  if (state.isLoginLoading) {
                    return const CustomLoader();
                  } else {
                    return AppCustomButton(
                      title: LocaleKeys.login.tr(),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<AuthCubit>()
                              .login(UserModel(phone: phoneController.text));
                        }
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
