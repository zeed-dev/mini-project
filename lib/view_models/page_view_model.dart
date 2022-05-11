import 'package:covid_app/view_models/base_view_model.dart';

class PageViewModel extends BaseViewModel {
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;
  selectedPageChange(int value) {
    _selectedPage = value;
    notifyListeners();
  }
}
