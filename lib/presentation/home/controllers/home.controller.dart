import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkwell/app/data/models/news_model.model.dart';
import 'package:inkwell/app/data/providers/news_model.provider.dart';

class HomeController extends GetxController {
  RxList articles = [].obs;
  NewsModelProvider provider = NewsModelProvider();

  RxMap chips = {
    "business": Icons.business,
    "entertainment": Icons.movie,
    "general": Icons.layers,
    "health": Icons.local_hospital,
    "science": Icons.science,
    "sports": Icons.sports,
    "technology": Icons.devices,
  }.obs;

  @override
  onInit() {
    log("onInitCalled");
    super.onInit();
  }

  @override
  onReady() async {
    log("onReadyCalled");

    await getArticleList(countryCode: 'in');
  }

  getArticleList({required String countryCode}) async {
    log("getArticleListCalled");
    final Response response =
        await provider.getTopHeadlines(countryCode: countryCode);

    if (response.statusCode == 200) {
      List articleJsonList = response.body["articles"];
      for (Map<String, dynamic> article in articleJsonList) {
        articles.add(NewsModel.fromJson(article));
      }

      printData();
    } else {
      // TODO: handle failed request
    }

    log("${articles.length}");
  }

  getArticleListByCategory({required String category}) async {
    final Response response = await provider.getTopHeadlinesByCategory(
      category: category,
    );

    articles.value = [];

    if (response.statusCode == 200) {
      List articleJsonList = response.body["articles"];
      for (Map<String, dynamic> article in articleJsonList) {
        articles.add(NewsModel.fromJson(article));
      }

      printData();
    } else {
      // TODO: handle failed request
    }
  }

  getArticleListBySearch({required String query}) async {
    final Response response = await provider.getArticlesBySearch(
      search: query,
    );

    articles.value = [];

    if (response.statusCode == 200) {
      List articleJsonList = response.body["articles"];
      for (Map<String, dynamic> article in articleJsonList) {
        articles.add(NewsModel.fromJson(article));
      }

      printData();
    } else {
      // TODO: handle failed request
    }
  }

  printData() {
    for (NewsModel article in articles) {
      log("Title: ${article.title}");
    }
  }
}
