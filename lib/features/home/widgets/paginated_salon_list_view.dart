import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:link_task/features/home/widgets/salon_item.dart';

import '../../../core/widgets/custom_loader.dart';
import '../cubits/home_cubit/home_cubit.dart';
import '../model/salon_model.dart';

class PaginatedSalonListView extends StatelessWidget {
  const PaginatedSalonListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    return PagedListView<int, SalonModel>.separated(
     separatorBuilder: (context, index) {
      return SizedBox(height: 24.h,);
    },
      pagingController: cubit.state.pagingController,
      padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 61.h),
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) =>  SalonItem(
          salonModel: item,
        ),
        firstPageProgressIndicatorBuilder: (context) =>
        const CustomLoader(),
        newPageProgressIndicatorBuilder: (context) =>
        const CustomLoader(),
        noItemsFoundIndicatorBuilder: (context) =>
        const Center(child: Text('No items found')),
      ),
    );

  }
}