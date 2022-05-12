import 'dart:convert';
import 'dart:developer';

import 'package:covid_app/common/const.dart';
import 'package:covid_app/models/distric.dart';
import 'package:covid_app/models/province.dart';
import 'package:covid_app/models/vaccine.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class VaccineService {
  Future<List<ProvinceModel>?> getProvince() async {
    Response? response;

    try {
      response = await post(Uri.parse(AppConstant.PROVINCE_URL)).timeout(
        const Duration(seconds: 30),
      );

      if (response.statusCode != 200) {
        return Future.error("Failed to fetch data province");
      }

      return ProvinceResults.fromJson(json.decode(response.body)).results;
    } catch (e) {
      if (kDebugMode) {
        log("Failed to fetch data: $e");
      }
      return Future.error("Failed to fetch data province");
    }
  }

  Future<List<DistricModel>?> getDistric(String provinceKey) async {
    Response? response;

    try {
      response = await post(
        Uri.parse("${AppConstant.DSITRIC_URL}?start_id=$provinceKey"),
      ).timeout(
        const Duration(seconds: 30),
      );

      if (response.statusCode != 200) {
        return Future.error("Failed to fetch data distric");
      }

      return DistricResult.fromJson(json.decode(response.body)).results;
    } catch (e) {
      if (kDebugMode) {
        log("Failed to fetch data: $e");
      }
      return Future.error("Failed to fetch data distric");
    }
  }

  Future<List<VaccineModel>?> getVaccine(
    String provinceKey,
    String districKey,
  ) async {
    Response? response;

    try {
      response = await get(
        Uri.parse(
          "${AppConstant.VACCINE_URL}?skip=0&province=$provinceKey&city=$districKey",
        ),
      ).timeout(
        const Duration(seconds: 30),
      );

      if (response.statusCode != 200) {
        return Future.error("Failed to fetch data vaccine");
      }

      return VaccineResults.fromJson(json.decode(response.body)).data;
    } catch (e) {
      if (kDebugMode) {
        log("Failed to fetch data: $e");
      }
      return Future.error("Failed to fetch data vaccine");
    }
  }
}

VaccineService vaccineService = VaccineService();
