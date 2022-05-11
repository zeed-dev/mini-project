import 'dart:convert';
import 'dart:developer';

import 'package:covid_app/common/const.dart';
import 'package:covid_app/models/covid.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CovidService {
  Future<CovidModel> getDataCovid() async {
    Response? response;

    try {
      response = await get(Uri.parse(AppConstant.COVID_URL)).timeout(
        const Duration(seconds: 30),
      );

      if (response.statusCode != 200) {
        return Future.error("Failed to fetch data");
      }

      return CovidModel.fromJson(json.decode(response.body));
    } catch (e) {
      if (kDebugMode) {
        log("Failed to fetch data: $e");
      }
      return Future.error("Failed to fetch data");
    }
  }
}

CovidService covidService = CovidService();
