import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/features/home/widgets/service_item.dart';

import '../cubits/home_cubit/home_cubit.dart';
import '../cubits/home_cubit/home_states.dart';

class ServicesTabWidget extends StatelessWidget {
  const ServicesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
      var services = state.services;
      return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 32.h),
        shrinkWrap: true,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 24.h,
        childAspectRatio: 0.9,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,children: List.generate(services?.length ?? 0, (index) => ServiceItem(serviceModel: services![index])),);
    });
  }
}