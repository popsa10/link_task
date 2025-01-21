

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_task/features/auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:link_task/features/auth/screens/register_screen.dart';
import 'package:link_task/features/auth/screens/verification_screen.dart';
import 'package:link_task/features/home/model/salon_model.dart';
import 'package:link_task/features/home/screens/home_screen.dart';
import 'package:link_task/features/home/screens/salon_details_screen.dart';

import '../../features/auth/screens/login_screen.dart';
import '../../features/home/cubits/home_cubit/home_cubit.dart';
import '../services/injector_service.dart';

class AppRoutes{
  static const String loginRoute = '/login';
  static const String verificationRoute = '/verification';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String salonDetailsRoute = '/salonDetails';

}

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context) => AuthCubit(authRepository),child: const LoginScreen()));
      case AppRoutes.verificationRoute:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => AuthCubit(authRepository),
          child: VerificationScreen(
            phoneNumber: settings.arguments as String,
          ),
        ));
      case AppRoutes.registerRoute:
        return MaterialPageRoute(builder: (_) =>  BlocProvider(create: (context) => AuthCubit(authRepository),child: const RegisterScreen()));
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) =>  BlocProvider(create: (context) => HomeCubit(homeRepository),child: const HomeScreen()));
      case AppRoutes.salonDetailsRoute:
        return MaterialPageRoute(builder: (_){
          int salonId = settings.arguments as int;
          return BlocProvider(
            create: (context) => HomeCubit(homeRepository)..getSalonDetails(salonId)..getServices(),
            child:  const SalonDetailsScreen(
            ),
          );
        });

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}