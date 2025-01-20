import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/core/cubit/theme_cubit/Theme_states.dart';
import 'package:link_task/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:link_task/core/utilities/app_constants.dart';
import 'package:link_task/core/utilities/app_themes.dart';

import 'core/services/injector_service.dart';
import 'core/utilities/app_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupInjector();
  cacheService.init();
  runApp(
    EasyLocalization(
        supportedLocales: AppConstants.supportedLocales,
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: AppConstants.fallbackLocale,
        startLocale: AppConstants.startLocale,
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
      create: (context) => ThemeCubit(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<ThemeCubit,ThemeState>(
          buildWhen: (previous, current) => current is ToggleThemeData,
          builder: (context, state){
            var cubit = BlocProvider.of<ThemeCubit>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstants.appName,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              darkTheme: AppThemes.darkTheme,
              themeMode: cubit.isDarkTheme() ? ThemeMode.dark : ThemeMode.light,
              theme: AppThemes.lightTheme,
              onGenerateRoute:AppRouter.generateRoute,
              initialRoute: AppRoutes.loginRoute,
            );
          }

        ),
      ),
    );
  }
}

