import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/utilities/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const AppCustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 64.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}
