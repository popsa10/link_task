import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/features/home/widgets/drawer.dart';

import '../widgets/salon_item.dart';

class HomeScreen extends StatefulWidget {

   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'صالونات الحلاقة',
        ),
        centerTitle: false,
        actions: [
         IconButton(onPressed: (){
           _scaffoldKey.currentState?.openEndDrawer();
         }, icon: const Icon(Icons.menu)),
        ],
      ),
      body: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
          itemBuilder: (context, index) {
        return const SalonItem();
      }, separatorBuilder: (context, index) {
        return SizedBox(height: 24.h,);
      }, itemCount: 5)
    );
  }
}
