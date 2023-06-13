import 'package:stacked/stacked.dart';
import 'upload_view_1.dart';
import 'upload_view_2.dart';
import 'upload_view_3.dart';
import 'upload_view_4.dart';
import 'upload_view_5.dart';

class UploadCoursesViewModel extends BaseViewModel {
  var screenNo = 0;
  var screens = [
    const UploadView_1(),
    const UploadView_2(),
    const UploadView_3(),
    const UploadView_4(),
    const UploadView_5(),
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
