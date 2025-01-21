import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_states.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../generated/locale_keys.g.dart';

class SelectGenderWidget extends StatelessWidget {

  const SelectGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
      var cubit = context.read<AuthCubit>();
      return Row(
        children: [
          Expanded(child: Row(children: [
            Radio(
              activeColor: AppColors.primaryLightColor,value: true, groupValue: cubit.isMale, onChanged: (value) {
             cubit.selectGender(value!);
            },),
            Text("male".tr(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
            const Spacer(),
            Radio(
              activeColor: AppColors.primaryLightColor,
              value: false, groupValue: cubit.isMale, onChanged: (value) {
              cubit.selectGender(value!);
            },),
            Text("female".tr(),style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
          ],)),
          const Expanded(child: SizedBox())
        ],
      );
    },);
  }
}
