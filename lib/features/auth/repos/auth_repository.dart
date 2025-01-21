
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:link_task/features/auth/model/login_model.dart';
import '../../../core/services/injector_service.dart';
import '../../../core/utilities/app_endpoints.dart';
import '../model/user_model.dart';

class AuthRepository {
  Future<String?> getDeviceToken() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    return await firebaseMessaging.getToken();
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if(Platform.isAndroid) {
      return const AndroidId().getId(); // unique ID on Android
    }
    return null;
  }

  Future<Either<String, String>> login(UserModel userModel) async {
    try {
      String? deviceToken = await getDeviceToken();
      userModel.firebaseToken = deviceToken;
      userModel.deviceId = await _getId();
      final response = await dioService.post(
          endpoint: AppEndpoints.loginEndpoint, data: userModel.toJson());

      if (response.statusCode == 200 && response.data["status"]) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return  Left(e.toString());
    }
  }

  Future<Either<String, LoginModel>> activeAccount(String phoneNumber,String code) async {
    try {
      final response = await dioService.post(
          endpoint: AppEndpoints.activeCodeEndpoint, data: {
            "phone": phoneNumber,
            "code": code,

      });

      if (response.statusCode == 200 && response.data["status"]) {
        return Right(LoginModel.fromJson(response.data['data']));
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return  Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> completeRegistration(UserModel userModel) async {
    try {
      final response = await dioService.post(
          endpoint: AppEndpoints.completeRegistrationEndpoint, data: userModel.toJson());
      if (response.statusCode == 200 && response.data["status"]) {
        var userModel = UserModel.fromJson(response.data["data"]);
        return Right(userModel);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return const Left("oops error");
    }
  }


  Future<Either<String, void>> logout() async {
    try {
      final response = await dioService.get(
          endpoint: AppEndpoints.logoutEndpoint,);
      if (response.statusCode == 200 && response.data["status"]) {
        return const Right(null);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return const Left("oops error");
    }
  }

}
