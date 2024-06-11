import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:juneeight/constants/newsapi_constants.dart';
import 'package:juneeight/di/service_locator.dart';
import 'package:juneeight/model/news_model.dart';

class NewsRepository {
  final Dio _dio = getIt.get<Dio>(instanceName: "MyBaseURL1");
  final Dio _dio2 = getIt.get<Dio>(instanceName: "MyBaseURL2");

  Future<NewsModel?> getNewsScreenData() async {
    var response = await _dio.get(
      NewsApiConstants.news,
      // "${AppConstants.posts}?_page=2&_limit=15",
      queryParameters: {
        "q": "bitcoin",
        "apiKey": "19f5064aeabb4603a859da738df6bd6a"
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'X-Api-Key': "19f5064aeabb4603a859da738df6bd6a",
        },
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      log(data.toString());

      // for (var item in data) {

      // }
      return NewsModel.fromJson(data);
    }
    return null;
  }
}
