import 'package:get_it/get_it.dart';
import 'package:mp_ui/data/repository/home_repository.dart';
import 'package:mp_ui/provider/home_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // For API AND FIREBASE

  //? Core
  // sl.registerLazySingleton(() => APIDioClient(APIConstants.BASE_URL, sl(),
  //     loggingInterceptor: sl(), sharedPreferences: sl()));

  //? Repository
  sl.registerLazySingleton(() => HomeRepository(sharedPreferences: sl()));
  // sl.registerLazySingleton(() => AddPlayerRepository(sharedPreferences: sl()));

  //? Provider
  sl.registerFactory(() => HomeProvider(mRepo: sl()));
  // sl.registerFactory(() => AddPlayerProvider(mRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => LoggingInterceptor());
  // sl.registerLazySingleton(() => Dio());
}
