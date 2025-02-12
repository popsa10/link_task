import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/utilities/app_constants.dart';
import 'package:link_task/core/utilities/app_themes.dart';
import 'core/cubit/app_cubit/app_cubit.dart';
import 'core/cubit/app_cubit/app_states.dart';
import 'core/services/injector_service.dart';
import 'core/utilities/app_routes.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupInjector();
  cacheService.init();
  runApp(
    EasyLocalization(
        supportedLocales: AppConstants.supportedLocales,
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: AppConstants.fallbackLocale,
        startLocale: AppConstants.startLocale,
        assetLoader: const CodegenLoader(),
        child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<AppCubit,AppState>(
          builder: (context, state){
            var cubit = BlocProvider.of<AppCubit>(context);
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: AppConstants.appName,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              darkTheme: AppThemes.darkTheme,
              themeMode: cubit.isDarkTheme() ? ThemeMode.dark : ThemeMode.light,
              theme: AppThemes.lightTheme,
              onGenerateRoute:AppRouter.generateRoute,
              initialRoute: cacheService.loadUserData() != null ? AppRoutes.homeRoute : AppRoutes.loginRoute,
            );
          }

        ),
      ),
    );
  }
}

