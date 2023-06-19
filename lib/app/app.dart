import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education_flutter_web/ui/views/courses/courses_view.dart';
import 'package:education_flutter_web/ui/views/dashboard/dashboard_view.dart';
import 'package:education_flutter_web/ui/views/teachers/teachers_view.dart';
import 'package:education_flutter_web/ui/views/settings/settings_view.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_courses_view.dart';
import 'package:education_flutter_web/ui/views/drawer/drawer_view.dart';
import 'package:education_flutter_web/ui/views/auth/login/login_view.dart';
import 'package:education_flutter_web/ui/views/auth/signup/signup_view.dart';
import 'package:education_flutter_web/ui/views/auth/verify/verify_view.dart';
import 'package:education_flutter_web/services/signup_service.dart';
import 'package:education_flutter_web/services/login_service.dart';
import 'package:education_flutter_web/services/courses_service.dart';
import 'package:education_flutter_web/ui/dialogs/error/error_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: CoursesView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: TeachersView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: UploadCoursesView),
    MaterialRoute(page: DrawerView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: VerifyView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SignupService),
    LazySingleton(classType: LoginService),
    LazySingleton(classType: CoursesService),
// @stacked-service
  ],
)
class App {}
