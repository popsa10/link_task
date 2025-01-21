
import 'package:get_it/get_it.dart';
import '../../features/auth/repos/auth_repository.dart';
import '../../features/home/repos/home_repository.dart';
import 'cache_service.dart';
import 'dio_service.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton(() => DioService());
  getIt.registerLazySingleton(() => CacheService());
  getIt.registerLazySingleton(() => AuthRepository());
   getIt.registerLazySingleton(() => HomeRepository());

}

DioService get dioService => getIt<DioService>();
CacheService get cacheService => getIt<CacheService>();
AuthRepository get authRepository => getIt<AuthRepository>();
HomeRepository get homeRepository => getIt<HomeRepository>();

