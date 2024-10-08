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
import 'package:education_flutter_web/ui/views/auth/forgetpassword/forgetpassword_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import 'package:education_flutter_web/ui/views/account/account_view.dart';
import 'package:education_flutter_web/services/rating_service.dart';
import 'package:education_flutter_web/services/profile_service.dart';
import 'package:education_flutter_web/services/dashboard_service.dart';
import 'package:education_flutter_web/ui/views/e_book/e_book_view.dart';
import 'package:education_flutter_web/services/ebook_service.dart';
import 'package:education_flutter_web/ui/views/e_book/upload_ebook/upload_ebook_view.dart';
import '../ui/widgets/pdf_viewer.dart';
import 'package:education_flutter_web/ui/views/chat_page/chat_page_view.dart';
import 'package:education_flutter_web/services/chat_service.dart';
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
    MaterialRoute(page: ForgetpasswordView),
    MaterialRoute(page: SplashScreenView),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: EBookView),
    MaterialRoute(page: UploadebookView),
    MaterialRoute(page: ChatPageView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SignupService),
    LazySingleton(classType: LoginService),
    LazySingleton(classType: CoursesService),
    LazySingleton(classType: RatingService),
    LazySingleton(classType: ProfileService),
    LazySingleton(classType: DashboardService),
    LazySingleton(classType: EbookService),
    LazySingleton(classType: ChatService),
// @stacked-service
  ],
)
class App {}
