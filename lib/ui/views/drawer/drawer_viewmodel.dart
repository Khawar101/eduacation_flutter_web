import 'package:education_flutter_web/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../courses/courses_view.dart';
import '../dashboard/dashboard_view.dart';

class DrawerViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  var pages = [
    const DashboardView(),
    const Text("2 page"),
    const Text("jhfghjfghjg"),
    const Text("page3"),
    const CoursesView(),
    const Text("page8"),
    const Text("page7"),
    const Text("page9"),
  ];
  var pageNo = 4;

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
}
