import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link_task/core/helper/navigation_extension.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';
import 'package:link_task/core/utilities/app_routes.dart';

class SalonItem extends StatelessWidget {
  const SalonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.navigateTo(AppRoutes.salonDetailsRoute);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightGreyColor)
        ),
        child: Row(
          children: [
            Container(
              width: 117.w,
              height: 101.h,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/117x101"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(width: 16.w,),
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'صالون الحلاق',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'صالون يقدم خدمات من اكثر من 20 سنة ',
                    style: TextStyle(
                      color: Color(0xFF263238),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Text(
                    'يشمل خدمات ( الحلاقة - المساج - السبا)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 7.5.h,),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.star),
                      SizedBox(width: 4.w,),
                       Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '(500)',
                              style: TextStyle(
                                color: Color(0xFF263238),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' 4.8',
                              style: TextStyle(
                                color: Color(0xFF6C6C6C),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      SvgPicture.asset(AppImages.location),
                      SizedBox(width: 4.w,),
                       Text(
                        '20 كم',
                        style: TextStyle(
                          color: const Color(0xFF002E5B),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )

                    ],
                  )

                ],
                         ),
             )
          ],
        ),
      ),
    );
  }
}
