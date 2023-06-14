// import 'package:education_flutter_web/app/app.router.dart';
import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// import '../../../app/app.locator.dart';

class CoursesViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  var pageNo = 1;
  nextPage() {
    print("=====>");
    pageNo += 1;
    notifyListeners();
  }

  backPage() {
    print("<=====");
    pageNo -= 1;
    notifyListeners();
  }
}
