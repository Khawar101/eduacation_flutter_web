import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'upload_view_1.dart';

class UploadCoursesViewModel extends BaseViewModel {
  var screenNo = 0;
  var screens = [
    const UploadView_1(),
    const Text("2 page"),
    const Text("page3"),
    const Text("page8"),
    const Text("page7"),
  ];

  backPage() {
    if (screenNo != 0) {
      screenNo -= 1;
      notifyListeners();
    }
  }

  nextPage() {
    if (screenNo != screens.length-1) {
      screenNo += 1;
      notifyListeners();
    }
  }
}
