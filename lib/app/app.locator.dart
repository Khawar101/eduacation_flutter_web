// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/chat_service.dart';
import '../services/courses_service.dart';
import '../services/dashboard_service.dart';
import '../services/ebook_service.dart';
import '../services/login_service.dart';
import '../services/profile_service.dart';
import '../services/rating_service.dart';
import '../services/signup_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SignupService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => CoursesService());
  locator.registerLazySingleton(() => RatingService());
  locator.registerLazySingleton(() => ProfileService());
  locator.registerLazySingleton(() => DashboardService());
  locator.registerLazySingleton(() => EbookService());
  locator.registerLazySingleton(() => ChatService());
}
