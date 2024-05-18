import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_pt_maha_akbar/core/network/network_client.dart';
import 'package:interview_pt_maha_akbar/features/home/data/api/home_api.dart';
import 'package:interview_pt_maha_akbar/features/home/data/repository/home_repository_impl.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
    ..registerFactory(() => NetworkClient(
          Dio(),
          url: "https://reqres.in/api",
        ))
    ..registerLazySingleton(() => HomeApi(serviceLocator<NetworkClient>().dio))
    ..registerLazySingleton(() => HomeRepositoryImpl(serviceLocator<HomeApi>()));
}
