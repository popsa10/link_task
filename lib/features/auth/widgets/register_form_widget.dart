import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/helper/validator_helper.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_states.dart';
import 'package:link_task/features/auth/model/city_model.dart';
import 'package:link_task/features/auth/widgets/select_gender_widget.dart';
import '../../../core/widgets/custom_drop_down_form_field.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../generated/locale_keys.g.dart';

class RegisterFormWidget extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  const RegisterFormWidget({super.key, required this.fullNameController, required this.emailController, required this.formKey,});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFormTextField(hintText: LocaleKeys.enterYourFullName.tr(),
            keyboardType: TextInputType.name,
            label: LocaleKeys.fullName.tr(),controller: fullNameController,validator: (value) {
            return Validator.validateName(value);
          },),
          SizedBox(height: 16.h,),
          CustomFormTextField(hintText: "${LocaleKeys.enterYourEmail.tr()} (${LocaleKeys.optional.tr()})",
            keyboardType: TextInputType.emailAddress,
            label: LocaleKeys.email.tr(),isOptional: true,controller: emailController,validator: (value) {
            if(value!.isNotEmpty) {
              return Validator.validateEmail(value);
            }
            return null;
          },),
          SizedBox(height: 16.h,),
          Text(LocaleKeys.selectGender.tr(),style:  TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
          SizedBox(height: 11.h,),
          const SelectGenderWidget(),
          SizedBox(height: 10.h,),
          BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return CustomDropDownFormField<int?>(
              hintText: LocaleKeys.selectYourCity.tr(),
              label: LocaleKeys.city.tr(),

              items: cities.map((e) => DropdownMenuItem(value: e.cityId,child: Text(e.cityName ?? ""),)).toList(),
              value: cubit.cityId,
              onChanged: (value){
                cubit.selectCity(value!);
              },
              validator: (value) {
                if(value == null){
                  return LocaleKeys.pleaseSelectYourCity.tr();
                }
                return null;

              },);
          },)

        ],
      ),
    );
  }
}
