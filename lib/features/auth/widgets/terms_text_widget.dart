import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/cubit/theme_cubit/theme_cubit.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../generated/locale_keys.g.dart';

class TermsTextWidget extends StatelessWidget {
  const TermsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text.rich(TextSpan(
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
    ));
  }
}
