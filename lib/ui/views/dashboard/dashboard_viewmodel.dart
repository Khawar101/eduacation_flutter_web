import 'package:education_flutter_web/app/app.locator.dart';
import 'package:education_flutter_web/services/dashboard_service.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  final dashboardService = locator<DashboardService>();
}
