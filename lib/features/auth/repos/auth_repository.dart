
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:link_task/core/services/notification_service.dart';
import 'package:link_task/features/auth/model/login_model.dart';
import '../../../core/errors/error_class.dart';
import '../../../core/services/injector_service.dart';
import '../../../core/utilities/app_endpoints.dart';
import '../model/user_model.dart';

class AuthRepository {

  Future<Either<Failure, void>> login(UserModel userModel) async {
    try {
      userModel.firebaseToken = await NotificationService.getDeviceToken();
      userModel.deviceId = await NotificationService.getDeviceId();
       var response = await dioService.post(endpoint: AppEndpoints.loginEndpoint, data: userModel.toJson());
      if (response.data["status"]) {
        return const Right(null);
      }else{
        return Left(ServerFailure(response.data['message']));
      }

    } catch (e) {

      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, LoginModel>> activeAccount(String phoneNumber,String code) async {
    try {
      final response = await dioService.post(
          endpoint: AppEndpoints.activeCodeEndpoint, data: {
            "phone": phoneNumber,
            "code": code,
      });

      if (response.data["status"]) {
        return Right(LoginModel.fromJson(response.data['data']));
      }else{
        return Left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, UserModel>> completeRegistration(UserModel userModel) async {
    try {
      final response = await dioService.post(
          endpoint: AppEndpoints.completeRegistrationEndpoint, data: userModel.toJson());
      if (response.data["status"]) {
        var userModel = UserModel.fromJson(response.data["data"]);
        return Right(userModel);
      } else {
        return Left(ServerFailure(response.data['message']));
      }
    } catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }


  Future<Either<Failure, void>> logout() async {
    try {
      final response = await dioService.get(
          endpoint: AppEndpoints.logoutEndpoint,);
      if (response.data["status"]) {
        return const Right(null);
      } else {
        return Left(response.data['message']);
      }
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

}
