
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../model/salon_model.dart';
import '../../repos/home_repository.dart';
import 'home_states.dart';


class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super( HomeState(status: HomeStatus.initial,pagingController: PagingController<int, SalonModel>(firstPageKey: 0)));

  static const _pageSize = 20;

  Future<void> getSalons(int pageKey) async {
    final res = await homeRepository.getSalons();
    final newItems = res.getOrElse(() => []);
    final isLastPage = newItems.length < _pageSize;

    if (isLastPage) {

      emit(state.copyWith(
        pagingController: state.pagingController..appendLastPage(newItems),
      ));
    } else {
      final nextPageKey = pageKey + newItems.length;
      emit(state.copyWith(
        pagingController: state.pagingController..appendPage(newItems, nextPageKey),
      ));
    }
  }

  Future<void> getServices() async {
      emit(state.copyWith(
        status: HomeStatus.servicesLoading,
      ));
      final res = await homeRepository.getServices();
      res.fold(
        (err) {
          emit(state.copyWith(
            status: HomeStatus.error,
            error: err,
          ));
        },
        (res) {
          emit(state.copyWith(
            services: res,
            status: HomeStatus.servicesLoaded,
          ));
        },
      );
  }


  void getSalonDetails(int salonId)async{
    emit(state.copyWith(
      status: HomeStatus.salonDetailsLoading,
    ));
    var res = await homeRepository.getSalonDetails(salonId);
    res.fold(
      (err) {
        emit(state.copyWith(
          status: HomeStatus.error,
          error: err,
        ));
      },
      (res) {
        emit(state.copyWith(
          status: HomeStatus.salonDetailsLoaded,
          salonDetails: res,
        ));
      },
    );

  }



}
