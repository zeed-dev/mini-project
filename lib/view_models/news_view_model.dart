import 'dart:developer';

import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/models/news.dart';
import 'package:covid_app/services/new_service.dart';
import 'package:covid_app/view_models/base_view_model.dart';

class NewsViewModel extends BaseViewModel {
  List<Article>? _articles = [];
  List<Article>? get articles => _articles;

  Future<void> getNews() async {
    try {
      requestStateChnage = RequestState.LOADING;
      final news = await newsService.getArticle();
      _articles = news;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR getNews :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }
}
