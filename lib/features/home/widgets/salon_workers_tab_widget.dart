import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/features/home/widgets/salon_worker_item.dart';

import '../cubits/home_cubit/home_cubit.dart';
import '../cubits/home_cubit/home_states.dart';

class SalonWorkersTabWidget extends StatelessWidget {

  const SalonWorkersTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
      var providers = state.salonDetails?.providers ?? [];
      return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 32.h),
          itemBuilder: (context, index) {

        return SalonWorkerItem(providerModel: providers[index]);
      }, separatorBuilder: (context, index) {
        return SizedBox(height: 24.h,);
      }, itemCount: providers.length);
    },);
  }
}