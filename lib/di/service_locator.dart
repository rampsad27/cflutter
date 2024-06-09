import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:juneeight/constants/api_constants.dart';
import 'package:juneeight/repository/home_repository.dart';

import 'package:juneeight/services/dio_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer _accessToken",
      },
    ),
  ));

  getIt.registerSingleton<DioHelper>(DioHelper()); //interceptor
  getIt.registerSingleton<HomeRepository>(HomeRepository());
}
