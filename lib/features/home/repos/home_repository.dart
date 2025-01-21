import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:link_task/features/home/model/service_model.dart';
import '../../../core/services/injector_service.dart';
import '../../../core/utilities/app_endpoints.dart';
import '../model/salon_model.dart';


class HomeRepository {



  Future<Either<String, List<SalonModel>>> getSalons() async {
    try {
      final response = await dioService.get(
          endpoint: AppEndpoints.salonsEndpoint);
      if (response.data["status"]) {
        final List<SalonModel> salons = [];
        response.data["data"]["data"].forEach((salon) {
          salons.add(SalonModel.fromJson(salon));
        });
        return Right(salons);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return  Left(e.toString());
    }
  }

  Future<Either<String, List<ServiceModel>>> getServices() async {
    try {
      final response = await dioService.get(
          endpoint: AppEndpoints.servicesEndpoint);
      if (response.data["status"]) {
        final List<ServiceModel> services = [];
        response.data["data"].forEach((service) {
          services.add(ServiceModel.fromJson(service));
        });
        return Right(services);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return  Left(e.toString());
    }
  }



  Future<Either<String, SalonModel>> getSalonDetails(int salonId) async {
    try {
      final response = await dioService.get(
          endpoint: "${AppEndpoints.salonsDetailsEndpoint}/$salonId");
      if (response.data["status"]) {
        return Right(SalonModel.fromJson(response.data["data"]));
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return  Left(e.toString());
    }
  }


}
