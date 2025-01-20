
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../../main.dart';
import '../utilities/app_constants.dart';
import '../utilities/app_endpoints.dart';
import 'injector_service.dart';

class DioService {
  final Dio _dio = Dio();

  DioService() {
    _dio.options.baseUrl = AppEndpoints.baseUrl;
    _dio.options.followRedirects = true;
    _dio.options.validateStatus = (status) {
      return status! <= 500;
    };
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true
    ));

    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = "Bearer ${cacheService.getData(AppConstants.userToken) ?? ""}";
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if(response.statusCode == 401){
          cacheService.removeData(AppConstants.userToken);
          cacheService.removeData(AppConstants.userData);
          // navigatorKey.currentState?.context.replaceWith(AppRoutes.registerRoute);
        }
        // Handle the response here
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // Handle errors here
        return handler.next(e);
      },
    ));
  }

   Future<Response> get({required String endpoint,Map<String,dynamic>? query}) async {
    try {
      final response = await _dio.get(endpoint,queryParameters: query);
      return response;
    } catch (e) {
      rethrow;
    }
  }

   Future<Response> post({required String endpoint, required Map<String, dynamic> data,bool isFormData = true}) async {

    try {
      final response = await _dio.post(endpoint, data: isFormData ? FormData.fromMap(data) : data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}