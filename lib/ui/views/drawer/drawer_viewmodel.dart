import 'package:education_flutter_web/app/app.router.dart';
import 'package:education_flutter_web/services/login_service.dart';
import 'package:education_flutter_web/ui/views/settings/settings_view.dart';
import 'package:education_flutter_web/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../account/account_view.dart';
import '../courses/courses_view.dart';
import '../dashboard/dashboard_view.dart';

class DrawerViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final loginService = locator<LoginService>();
  var pages = [
    const AccountView(),
    const DashboardView(),
    const Text("3 jhfghjfghjg"),
    const Text("page 4"),
    const CoursesView(),
    const Text("page 6"),
    const Text("page 7"),
    const SettingsView()
  ];
  var pageNo = 0;

  updatePage(value) {
    pageNo = value;
    notifyListeners();
    rebuildUi();
  }

  navigateLogin() {
    _navigationService.navigateToLoginView();
  }

  navigateBack() {
    _navigationService.back();
  }

  removeDataFromSpAndGoToLogin() async {
    await Store.removeValueAgainstKey('userId');
    _navigationService.navigateToLoginView();
  }
}
