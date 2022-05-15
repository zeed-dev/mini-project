import 'dart:developer';

import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/models/covid.dart';
import 'package:covid_app/services/covid_service.dart';
import 'package:covid_app/view_models/base_view_model.dart';

class CovidViewModel extends BaseViewModel {
  CovidModel? _covidModel;
  CovidModel get covid => _covidModel ?? CovidModel();

  Future getDataCovid() async {
    try {
      requestStateChnage = RequestState.LOADING;
      final covid = await covidService.getDataCovid();
      _covidModel = covid;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR getDataCovid :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }
}
