// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names

import 'package:education_flutter_web/app/app.locator.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  bool _obscureText = true;
  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();
  // final _loginService = locator<LoginService>();

  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  navigateButtomBar() {
    // _navigationService.navigateToButtomBarView();
  }
}
