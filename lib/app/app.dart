import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education_flutter_web/ui/views/courses/courses_view.dart';
import 'package:education_flutter_web/ui/views/dashboard/dashboard_view.dart';
import 'package:education_flutter_web/ui/views/teachers/teachers_view.dart';
import 'package:education_flutter_web/ui/views/settings/settings_view.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_courses_view.dart';
import 'package:education_flutter_web/ui/views/drawer/drawer_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: CoursesView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: TeachersView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: UploadCoursesView),
    MaterialRoute(page: DrawerView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
)
class App {}
