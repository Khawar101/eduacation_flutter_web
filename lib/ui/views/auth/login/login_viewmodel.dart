// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names

import 'package:education_flutter_web/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/Model/userData.dart';
import '../../../../services/login_service.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../../utils/snakBar.dart';

class LoginViewModel extends BaseViewModel {
  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();

  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  navigateButtomBar() {
    // _navigationService.navigateToButtomBarView();
  }

  navigateSignup() {
    _navigationService.navigateToSignupView();
  }

  navigateForget() {
    // _navigationService.navigateToForgetView();
  }
  TextEditingController emailCTRL =
      TextEditingController(text: "xyz@gmail.com");

  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");

  bool looding = false;
  bool _obscureText = true;

  logIN(context) async {
    userData userDetail = await _loginService.logins(emailCTRL, passwordCTRL);
    if (_loginService.message == 'login successfully') {
      if (userDetail.uID!.isNotEmpty && userDetail.uID != "") {
        await Store.save('userId', userDetail.uID!);
      }
      _navigationService.navigateToDrawerView();
    }
    snakBar(context, _loginService.message);
  }
}
