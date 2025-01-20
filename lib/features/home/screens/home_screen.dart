import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/salon_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(

      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'صالونات الحلاقة',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        actions: [
         IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
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
