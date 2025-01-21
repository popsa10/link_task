import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_drawer.dart';
import '../../../generated/locale_keys.g.dart';
import '../cubits/home_cubit/home_cubit.dart';
import '../widgets/paginated_salon_list_view.dart';

class HomeScreen extends StatefulWidget {

   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    final cubit = context.read<HomeCubit>();
    cubit.state.pagingController.addPageRequestListener((pageKey) {
     cubit.getSalons(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    context.read<HomeCubit>().state.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(
          LocaleKeys.barberSalons.tr(),
        ),
        centerTitle: false,
        actions: [
         IconButton(onPressed: (){
           _scaffoldKey.currentState?.openEndDrawer();
         }, icon: const Icon(Icons.menu)),
        ],
      ),
      body:  const PaginatedSalonListView()
    );
  }
}



