
import 'package:app_rick_and_morty/core/app_constants.dart';
import 'package:app_rick_and_morty/services/rick_and_morty_api_sevice.dart';
import 'package:app_rick_and_morty/store/home_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;

void setupDependencies(){
  getIt.registerLazySingleton(()=> Dio(BaseOptions(baseUrl: Constants.baseURL)));
  getIt.registerLazySingleton(() => RickAndMortyApiSevice(getIt()));
  getIt.registerLazySingleton(() => HomeStore(getIt()));
 

}

