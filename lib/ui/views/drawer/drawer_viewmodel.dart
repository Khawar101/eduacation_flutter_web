import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../courses/courses_view.dart';
import '../dashboard/dashboard_view.dart';

class DrawerViewModel extends BaseViewModel {
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
  }
}
