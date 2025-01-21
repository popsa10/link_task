


import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:link_task/features/home/model/service_model.dart';

import '../../model/salon_model.dart';
import '../../model/product_model.dart';

enum HomeStatus{ initial ,salonsLoading , salonsLoaded,salonDetailsLoading , salonDetailsLoaded, servicesLoading , servicesLoaded, error }

extension HomeStatusX on HomeState {
  bool get isInitial => status == HomeStatus.initial;
  bool get isSalonsLoading => status == HomeStatus.salonsLoading;
  bool get isSalonsLoaded => status == HomeStatus.salonsLoaded;
  bool get isSalonDetailsLoading => status == HomeStatus.salonDetailsLoading;
  bool get isSalonDetailsLoaded => status == HomeStatus.salonDetailsLoaded;
  bool get isServicesLoading => status == HomeStatus.servicesLoading;
  bool get isServicesLoaded => status == HomeStatus.servicesLoaded;
  bool get isError => status == HomeStatus.error;

}

class HomeState {
  late PagingController<int, SalonModel> pagingController;
  final HomeStatus status;
  final List<SalonModel>? salons;
  final List<ServiceModel>? services;
  final SalonModel? salonDetails;
  final String? error;
   HomeState(
      {required this.status,this.salons,this.services,this.salonDetails,this.error,required this.pagingController});

  HomeState copyWith({
    HomeStatus? status,
    List<SalonModel>? salons,
    List<ServiceModel>? services,
    SalonModel? salonDetails,
    PagingController<int, SalonModel>? pagingController,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      salons: salons ?? this.salons,
      services: services ?? this.services,
      salonDetails: salonDetails ?? this.salonDetails,
      pagingController: pagingController ?? this.pagingController,
      error: error ?? this.error,
    );
  }


}





