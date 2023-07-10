// ignore_for_file: unused_field, avoid_print
import 'package:education_flutter_web/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/Model/userData.dart';
import '../../../services/profile_service.dart';
import '../../../utils/snakBar.dart';

class SettingsViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();
  final profileService = locator<ProfileService>();
  userData get userdata => _loginService.UserData;
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool regionData = false;
  bool basicData = false;
  bool personalData = false;

  basicDataEdit() {
    basicData = !basicData;
    notifyListeners();
  }

  personalDataEdit() {
    personalData = !personalData;
    notifyListeners();
  }

  basicDataUpdate(context) async {
    await profileService.basicDataUpdate(usernameController.text);
    if (profileService.message == 'update successfully') {
      print("=====>${profileService.message}");
      successToast(context, "Edit Done Sucessfully");
      basicDataEdit();
    } else {
      print("=====>${profileService.message}");
      errorToast(context, "please enter complete info");
    }
  }

  personalDataUpdate(context) async {
    await profileService.personalDataUpdatee(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        phoneController.text,
        bioController.text,
        addressController.text,
        cityController.text,
        countryController.text);
    if (profileService.message == 'update successfully') {
      print("=====>${profileService.message}");
      successToast(context, "Edit Done Sucessfully");
      personalDataEdit();
    } else {
      print("=====>${profileService.message}");
      errorToast(context, "please enter complete info");
    }
  }
  uploadProfile(){
       profileService.uploadProfile(notifyListeners);
  }
}
