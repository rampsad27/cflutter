import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:juneeight/constants/api_constants.dart';
import 'package:juneeight/di/service_locator.dart';
import 'package:juneeight/model/post_model.dart';

class HomeRepository {
  final Dio _dio = getIt.get<Dio>();

  Future<List<PostModel>> getHomeScreenData() async {
    List<PostModel> posts = [];

    var response = await _dio.get(
      ApiConstants.posts,
      // "${AppConstants.posts}?_page=2&_limit=15",
      queryParameters: {
        "_page": 1,
        "_limit": 3,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer AcccessToken",
        },
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      log(data.toString());

      for (var item in data) {
        posts.add(PostModel.fromJson(item));
      }
      return posts;
    }
    return posts;
  }

  Future<String> addPost(PostModel postModel) async {
    try {
      print(postModel.toJson());
      final res = await _dio.post(
        ApiConstants.posts,
        data: postModel.toJson(),
      );
      if (res.statusCode == 200) {
        return " successs";
      }
      return "failed";
    } catch (e) {
      rethrow;
    }
  }

  Future<String> deletePost(int id) async {
    try {
      final res = await _dio.delete(
        "${ApiConstants.posts}/$id",
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return "del done";
      }
      return "fail del";
    } catch (e) {
      rethrow;
    }
  }
}
