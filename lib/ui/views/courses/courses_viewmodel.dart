import 'dart:developer';
import 'package:stacked/stacked.dart';

class CoursesViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  var pageNo = 0;
  nextPage() {
    log("=>");
    pageNo += 1;
    notifyListeners();
  }

  backPage() {
    log("<=");
    pageNo -= 1;
    notifyListeners();
  }
}
