import 'dart:developer';

import 'package:get/get.dart';
import 'package:inkwell/config.dart';

import '../models/news_model.model.dart';

class NewsModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return NewsModel.fromJson(map);
      if (map is List) {
        return map.map((item) => NewsModel.fromJson(item)).toList();
      }
    };
  }

  Future<Response> getTopHeadlines({required String countryCode}) async {
    final response = await get(
      "${ConfigEnvironments.getEnvironments()["url"]}/top-headlines?country=$countryCode&sortBy=relevancy",
      headers: {
        "x-api-key": "ec649d95b1334d639a1ec050153e56ce",
      },
    );
    return response;
  }

  Future<Response> getTopHeadlinesByCategory({required String category}) async {
    log("${ConfigEnvironments.getEnvironments()["url"]}/everything?q=$category&apiKey=ec649d95b1334d639a1ec050153e56ce");
    final response = await get(
      "${ConfigEnvironments.getEnvironments()["url"]}/everything?q=$category&sortBy=relevancy",
      headers: {
        "x-api-key": "ec649d95b1334d639a1ec050153e56ce",
      },
    );
    return response;
  }

  Future<Response> getArticlesBySearch({required String search}) async {
    log("${ConfigEnvironments.getEnvironments()["url"]}/everything?q=$search&apiKey=ec649d95b1334d639a1ec050153e56ce");
    final response = await get(
      "${ConfigEnvironments.getEnvironments()["url"]}/everything?q=$search&sortBy=relevancy",
      headers: {
        "x-api-key": "ec649d95b1334d639a1ec050153e56ce",
      },
    );
    return response;
  }
}
