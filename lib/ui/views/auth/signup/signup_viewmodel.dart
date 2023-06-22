// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names

import 'dart:developer';
import 'package:education_flutter_web/app/app.locator.dart';
import 'package:education_flutter_web/app/app.router.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../services/signup_service.dart';

class SignupViewModel extends BaseViewModel {
  bool visibleCheck = true;
  String userType = "Teacher";
  var profile;
  final _navigationService = locator<NavigationService>();
  final _signupService = locator<SignupService>();
  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  changeGender(value) {
    userType = value;
    notifyListeners();
  }

  navigateLogin() {
    _navigationService.navigateToLoginView();
  }

  navigateforgetpassword() {
    _navigationService.navigateToLoginView();
  }

  TextEditingController nameCTRL = TextEditingController(text: "xyz");
  TextEditingController emailCTRL = TextEditingController(text: "");
  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");
  signUP() async {
    await _signupService.createAccount(
        nameCTRL, emailCTRL, passwordCTRL, userType);
    if (_signupService.message == '') {
      log("sign up now...");
      // _navigationService.navigateToVerifyView();
    } else {
      log("try again...");
    }
    log("=====>${_signupService.message}");
    print("1232");
  }

  uploadProfile() async {
    await _signupService.pickImage().whenComplete(() {
      if (_signupService.message != '') {
        log("Profile uploded successfully...");
        // _navigationService.navigateToVerifyView();
        profile = _signupService.profile;
        log('2====>$profile');
        notifyListeners();
      } else {
        log("try again...");
      }
      log("=====>${_signupService.message}");
    });
  }

  sendOtp() async {
    await _signupService.sendOtpS(nameCTRL, emailCTRL, passwordCTRL);
    if (_signupService.message == 'OTP has been sent') {
      log("sign up now...");
      _navigationService.navigateToVerifyView();
    } else {
      log("try again...");
    }
    log("=====>${_signupService.message}");
    print("123456789");
  }
}
