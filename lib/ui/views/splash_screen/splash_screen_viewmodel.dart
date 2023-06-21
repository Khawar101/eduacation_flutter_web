import 'package:education_flutter_web/app/app.router.dart';
import 'package:education_flutter_web/utils/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/login_service.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();

  String userId = '';

  navigateLogin() {
    _navigationService.navigateToLoginView();
  }

  checkIfUserLoggedIn() async {
    userId = await Store.retrieve('userId');
    if (userId.isNotEmpty && userId != "") {
      _loginService.updateUserData(userId);
      Future.delayed(const Duration(seconds: 4), () {
        _navigationService.navigateToDrawerView();
      });
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        _navigationService.navigateToLoginView();
      });
    }
  }
}
