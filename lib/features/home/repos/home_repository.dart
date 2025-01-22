import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:link_task/core/errors/error_class.dart';
import 'package:link_task/features/home/model/service_model.dart';
import '../../../core/services/injector_service.dart';
import '../../../core/utilities/app_endpoints.dart';
import '../model/salon_model.dart';


class HomeRepository {



  Future<Either<Failure, List<SalonModel>>> getSalons() async {
    try {
      final response = await dioService.get(
          endpoint: AppEndpoints.salonsEndpoint);
      if (response.data["status"]) {
        final List<SalonModel> salons = [];
        for (var i = 0; i < response.data["data"]["data"].length; i++){
          salons.add(SalonModel.fromJson(response.data["data"]["data"][i]));
        }
        return Right(salons);
      } else {
        return Left(ServerFailure(response.data['message']));
      }
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, List<ServiceModel>>> getServices() async {
    try {
      final response = await dioService.get(
          endpoint: AppEndpoints.servicesEndpoint);
      if (response.data["status"]) {
        final List<ServiceModel> services = [];
        for (var i = 0; i < response.data["data"].length; i++){
          services.add(ServiceModel.fromJson(response.data["data"][i]));
        }
        return Right(services);
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



  Future<Either<Failure, SalonModel>> getSalonDetails(int salonId) async {
    try {
      final response = await dioService.get(
          endpoint: "${AppEndpoints.salonsDetailsEndpoint}/$salonId");
      if (response.data["status"]) {
        return Right(SalonModel.fromJson(response.data["data"]));
      } else {
        return Left(ServerFailure(response.data['message']));
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
