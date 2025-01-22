import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/utilities/app_decoration.dart';
import '../cubit/app_cubit/app_cubit.dart';
import '../utilities/app_colors.dart';

class CustomDropDownFormField<T> extends StatefulWidget {
  final String hintText;
  final String label;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final T value;
  const CustomDropDownFormField({super.key, required this.hintText, required this.label, required this.items, this.onChanged, required this.value, this.validator,});

  @override
  State<CustomDropDownFormField<T>> createState() => _CustomDropDownFormFieldState<T>();
}

class _CustomDropDownFormFieldState<T> extends State<CustomDropDownFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(widget.label,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
         SizedBox(height: 10.h,),
        DropdownButtonFormField<T>(
          items: widget.items,
          onChanged: (value){
          widget.onChanged?.call(value); 
          setState(() {});
          },
          value: widget.value,
          validator: widget.validator,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down,color: AppColors.greyColor),
          style: TextStyle(
              color: context.watch<AppCubit>().isDarkTheme() ? null: AppColors.greyColor ,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500
          ),
          hint: Text(widget.hintText,style: TextStyle(
              color: context.watch<AppCubit>().isDarkTheme() ? null : AppColors.greyColor ,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500
          ),),
          decoration: InputDecoration(
            filled: context.watch<AppCubit>().isDarkTheme(),
            fillColor: context.watch<AppCubit>().isDarkTheme() ? AppColors.lightBlackColor :null,
            contentPadding: EdgeInsets.all(16.h),

              border: AppDecoration.buildOutlineBorder(context),
              focusedBorder: AppDecoration.buildOutlineBorder(context),
              enabledBorder: AppDecoration.buildOutlineBorder(context),

          ),
        ),
      ],
    );
  }
}
