import 'dart:developer';

import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/models/user.dart';
import 'package:covid_app/services/auth_service.dart';
import 'package:covid_app/view_models/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel() {
    getCurrentUser();
  }

  UserModel? _user;
  UserModel? get user => _user;

  Future<void> signIn(String email, String password) async {
    try {
      requestStateChnage = RequestState.LOADING;
      final user = await authService.signIn(email, password);
      _user = user;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }

  Future<void> signUp(UserModel userModel, String password) async {
    try {
      requestStateChnage = RequestState.LOADING;
      final user = await authService.signUp(userModel, password);
      _user = user;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }

  Future<void> getCurrentUser() async {
    try {
      requestStateChnage = RequestState.LOADING;
      final user = await authService.getCurrentUser();
      _user = user;
      log("USER CURRENT ${user!.isAdmin}");
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }
}
