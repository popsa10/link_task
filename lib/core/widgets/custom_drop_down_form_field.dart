import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/utilities/app_decoration.dart';

import '../utilities/app_colors.dart';

class CustomDropDownFormField<T> extends StatelessWidget {
  final String hintText;
  final String label;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final T value;
  const CustomDropDownFormField({super.key, required this.hintText, required this.label, required this.items, this.onChanged, required this.value,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(label,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
         SizedBox(height: 10.h,),
        DropdownButtonFormField<T>(
          items: items,
          onChanged: onChanged,
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down,color: AppColors.greyColor),
          hint: Text(hintText,style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 12,
              fontWeight: FontWeight.normal
          ),),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),

              border: AppDecoration.buildOutlineBorder(),
              focusedBorder: AppDecoration.buildOutlineBorder(),
              enabledBorder: AppDecoration.buildOutlineBorder(),

          ),
        ),
      ],
    );
  }

}