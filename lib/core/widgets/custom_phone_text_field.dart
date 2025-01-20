import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_task/core/utilities/app_images.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_decoration.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
            hintText: "50xxxxxxx",
            hintStyle: TextStyle(
                color: AppColors.greyColor,
                fontSize: 12,
                fontWeight: FontWeight.normal
            ),
            border: AppDecoration.buildOutlineBorder(),
            focusedBorder: AppDecoration.buildOutlineBorder(),
            enabledBorder: AppDecoration.buildOutlineBorder(),
            prefixIcon:  SizedBox(
              height: 10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(
                    AppImages.saudiFlag
                                ),
                ),
                  const Text(
                    '+966',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                    child: VerticalDivider(
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

}
