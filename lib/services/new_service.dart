import 'dart:convert';
import 'dart:developer';

import 'package:covid_app/common/const.dart';
import 'package:covid_app/models/news.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class NewsService {
  Future<List<Article>> getArticle() async {
    Response? response;

    try {
      response = await get(Uri.parse(AppConstant.NEWS_URL)).timeout(
        const Duration(seconds: 30),
      );

      if (response.statusCode != 200) {
        return Future.error("Failed to fetch data");
      }

      return NewsResponse.fromJson(json.decode(response.body)).articles;
    } catch (e) {
      if (kDebugMode) {
        log("Failed to fetch data: $e");
      }
      return Future.error("Failed to fetch data");
    }
  }
}

NewsService newsService = NewsService();
