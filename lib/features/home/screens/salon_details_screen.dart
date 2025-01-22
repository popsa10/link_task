
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/widgets/custom_cached_network_image.dart';
import 'package:link_task/core/widgets/error_snackbar_widget.dart';
import 'package:link_task/features/home/cubits/home_cubit/home_cubit.dart';
import 'package:link_task/features/home/cubits/home_cubit/home_states.dart';
import 'package:link_task/features/home/model/salon_model.dart';
import 'package:link_task/features/home/widgets/custom_back_widget.dart';
import 'package:link_task/generated/locale_keys.g.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/cubit/app_cubit/app_cubit.dart';
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
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: BlocConsumer<HomeCubit, HomeState>(
          builder: (context, state) {
            var salonDetails = state.salonDetails ?? salonModel;

            return Skeletonizer(
              enabled: state.isSalonDetailsLoading || state.isServicesLoading,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 330.h,
                      pinned: true,
                      leading:  const CustomBackWidget() ,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            CustomCachedNetworkImage(
                              height: 330.h,
                              imageUrl: salonDetails.image ?? "",
                            ),

                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: Column(
                  children: [
                    // Container with TabBar and TabBarView
                    Container(
                      decoration: BoxDecoration(
                        color: context.watch<AppCubit>().isDarkTheme()
                            ? AppColors.blackColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          SalonDetailsHeaderWidget(salonModel: salonDetails),
                          SizedBox(height: 16.h),
                          SalonShareWidget(salonId: salonDetails.id!),
                          SizedBox(height: 16.h),
                          Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: context.watch<AppCubit>().isDarkTheme()
                                  ? AppColors.lightBlackColor
                                  : AppColors.borderColor,
                            ),
                          ),
                          // TabBar
                          TabBar(
                            tabs: [
                              Tab(text: LocaleKeys.services.tr()),
                              Tab(text: LocaleKeys.salonWorkers.tr()),
                            ],
                            indicatorPadding:
                            EdgeInsets.symmetric(horizontal: 16.w),
                          ),
                        ],
                      ),
                    ),
                    // TabBarView
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ServicesTabWidget(),
                          SalonWorkersTabWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state.isError) {
              showErrorBar(context, state.error?.errorMessage ?? "");
            }
          },
        ),
      ),
    );
  }
}





