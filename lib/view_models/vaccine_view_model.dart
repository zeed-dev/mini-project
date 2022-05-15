import 'dart:developer';

import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/models/distric.dart';
import 'package:covid_app/models/province.dart';
import 'package:covid_app/models/vaccine.dart';
import 'package:covid_app/services/vaccine_service.dart';
import 'package:covid_app/view_models/base_view_model.dart';

class VaccineViewModel extends BaseViewModel {
  List<ProvinceModel>? _provinceModel;
  List<ProvinceModel>? get province => _provinceModel ?? [];
  set provinceModel(List<ProvinceModel>? value) {
    _provinceModel = value;
    notifyListeners();
  }

  List<DistricModel>? _districModel;
  List<DistricModel>? get distric => _districModel ?? [];
  set districModel(List<DistricModel>? value) {
    _districModel = value;
    notifyListeners();
  }

  List<VaccineModel>? _vaccineModel;
  List<VaccineModel>? get vaccine => _vaccineModel ?? [];
  set vaccineModel(List<VaccineModel>? value) {
    _vaccineModel = value;
    notifyListeners();
  }

  Future<void> getProvince() async {
    try {
      requestStateChnage = RequestState.LOADING;
      final province = await vaccineService.getProvince();
      provinceModel = province;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR getProvince :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }

  Future<void> getDistric(String provinceKey) async {
    try {
      requestStateChnage = RequestState.LOADING;
      final distric = await vaccineService.getDistric(provinceKey);
      districModel = distric;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR getDistric :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }

  Future<void> getVaccine(String provinceKey, String districKey) async {
    try {
      requestStateChnage = RequestState.LOADING;
      final vaccine = await vaccineService.getVaccine(provinceKey, districKey);
      vaccineModel = vaccine;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR getVaccine :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }
}
