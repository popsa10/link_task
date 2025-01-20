import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_task/core/utilities/app_colors.dart';
import 'package:link_task/core/utilities/app_images.dart';

class SalonDetailsScreen extends StatelessWidget {
  const SalonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 330.h,
              leading: Container(
                margin: const EdgeInsets.all(10),
                width: 40.w,
                height: 40.h,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
                child: const Icon(
                    Icons.arrow_back_outlined
                ),
              ),
              floating: false,
              pinned: true,
              flexibleSpace: Column(
                children: [
                  Container(
                    height: 330.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://s3-alpha-sig.figma.com/img/4972/0232/3662f65ecb5394fe96318c6fddfc392d?Expires=1738540800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SAnfQP7tggsxBkhfHvzz6XE7snRP96U4cb95fmyFLD-LxPTyPykz4KK6CxowQvp7xjpWqW35PJel6Y1K2tf5Q8g9B1mJk5szt2-CmrnZOM5sYWXAh2oajvhYkcqjawQyIwLwcTiRL-kXIXi7ZLwbTwrXEhKPMz3FGLZWgNE63DsbOLzYeCkbztbgKSKEZChpgGSP4vkJxccqMIwTP9kT0yvtOCj8GHwf~-f9SQR~SOAuFqZ-0EZ4pvLFp9MSCmxaL~NL3PmOmeGUjnAPzxs5l-u9-ZdjAxsUZRaqR5Zj4eTD4-e4kF36D7mw2Cp05ay~IbRZ29yluGHjo~ijqg5Qog__"),
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),

                ],
              ),
            ),
        // SliverPersistentHeader(
        //   pinned: true,
        //   delegate: _TabBarDelegate(
        //      TabBar(
        //         tabs: const [
        //     Tab(text: 'الخدمات'),
        //     Tab(text: 'عمال الصالون'),
        //     ],
        //       indicatorWeight: 2,
        //       indicatorColor: AppColors.primaryLightColor,
        //       labelColor: AppColors.primaryLightColor,
        //       labelPadding: const EdgeInsets.symmetric(vertical: 22),
        //       indicatorSize: TabBarIndicatorSize.tab,
        //       dividerHeight: 2,
        //       dividerColor: const Color(0xFFF1F1F1),
        //       unselectedLabelColor: const Color(0xFF263238),
        //       indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
        //   ),
        // ),
        //     ),
        //     const SliverFillRemaining(
        //       child: TabBarView(
        //         children: [
        //           ServicesTabWidget()
        //         ],
        //       ),
        //     )
          ],

        ),
      )
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}


class ServicesTabWidget extends StatelessWidget {
  const ServicesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      childAspectRatio: 0.9,
      mainAxisSpacing: 24,children: List.generate(10, (index) => Column(
      children: [
        Container(
          width: 181,
          height: 146,
          decoration: ShapeDecoration(
            image: const DecorationImage(
              image: NetworkImage("https://via.placeholder.com/181x146"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: 8.h,),
        const Text(
          'حلاقة شعر', 
          style: TextStyle(
            color: Color(0xFF263238),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    )),);
  }
}

