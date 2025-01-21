
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/widgets/custom_cached_network_image.dart';
import 'package:link_task/core/widgets/error_snackbar_widget.dart';
import 'package:link_task/features/home/cubits/home_cubit/home_cubit.dart';
import 'package:link_task/features/home/cubits/home_cubit/home_states.dart';
import 'package:link_task/features/home/model/salon_model.dart';
import 'package:link_task/generated/locale_keys.g.dart';
import '../widgets/custom_back_widget.dart';
import '../widgets/salon_details_header_widget.dart';
import '../widgets/salon_services_tab_widget.dart';
import '../widgets/salon_share_widget.dart';
import '../widgets/salon_workers_tab_widget.dart';

class SalonDetailsScreen extends StatefulWidget {
  const SalonDetailsScreen({super.key,});

  @override
  State<SalonDetailsScreen> createState() => _SalonDetailsScreenState();
}

class _SalonDetailsScreenState extends State<SalonDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                leading: const CustomBackWidget(),
                collapsedHeight: 670.h,
                flexibleSpace: BlocConsumer<HomeCubit,HomeState>(
                  listener: (context, state) {
                    if(state.isError){
                      showErrorBar(context, state.error ?? "");
                    }
                  },
                  builder: (context, state) {
                    var salonDetails = state.salonDetails ?? SalonModel();
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      CustomCachedNetworkImage(height: 330.h,imageUrl: salonDetails.image ?? ""),
                      PositionedDirectional(
                        start: 0,
                        top: 310.h,
                        bottom: 0,
                        end: 0,
                        child: Container(
                          decoration:  BoxDecoration(
                              color: context.watch<ThemeCubit>().isDarkTheme() ? AppColors.blackColor : AppColors.whiteColor,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 35.h,),
                               SalonDetailsHeaderWidget(
                                salonModel: salonDetails,
                              ),
                              SizedBox(height: 40.h,),
                              const SalonShareWidget(),
                              SizedBox(height: 31.h,),
                              Container(
                                height: 8.h,
                                decoration:  BoxDecoration(color:  context.watch<ThemeCubit>().isDarkTheme() ? AppColors.lightBlackColor :AppColors.borderColor),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ],

                  );
                },),
                bottom:  TabBar(
                  tabs: [
                    Tab(text: LocaleKeys.services.tr()),
                    Tab(text: LocaleKeys.salonWorkers.tr()),
                  ],
                  indicatorPadding:  EdgeInsets.symmetric(horizontal: 16.w),
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              ServicesTabWidget(),
              SalonWorkersTabWidget()
            ],
          )
        ),
      )
    );
  }
}





