// ignore_for_file: unused_field

import 'package:education_flutter_web/services/login_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/Model/userData.dart';

class SettingsViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();
  userData get userdata => _loginService.UserData;
}
