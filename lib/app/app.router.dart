// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:education_flutter_web/ui/views/auth/login/login_view.dart'
    as _i8;
import 'package:education_flutter_web/ui/views/auth/signup/signup_view.dart'
    as _i9;
import 'package:education_flutter_web/ui/views/courses/courses_view.dart'
    as _i2;
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_courses_view.dart'
    as _i6;
import 'package:education_flutter_web/ui/views/dashboard/dashboard_view.dart'
    as _i3;
import 'package:education_flutter_web/ui/views/drawer/drawer_view.dart' as _i7;
import 'package:education_flutter_web/ui/views/settings/settings_view.dart'
    as _i5;
import 'package:education_flutter_web/ui/views/teachers/teachers_view.dart'
    as _i4;
import 'package:education_flutter_web/ui/views/auth/verify/verify_view.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const coursesView = '/courses-view';

  static const dashboardView = '/dashboard-view';

  static const teachersView = '/teachers-view';

  static const settingsView = '/settings-view';

  static const uploadCoursesView = '/upload-courses-view';

  static const drawerView = '/drawer-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const verifyView = '/verify-view';

  static const all = <String>{
    coursesView,
    dashboardView,
    teachersView,
    settingsView,
    uploadCoursesView,
    drawerView,
    loginView,
    signupView,
    verifyView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.coursesView,
      page: _i2.CoursesView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i3.DashboardView,
    ),
    _i1.RouteDef(
      Routes.teachersView,
      page: _i4.TeachersView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i5.SettingsView,
    ),
    _i1.RouteDef(
      Routes.uploadCoursesView,
      page: _i6.UploadCoursesView,
    ),
    _i1.RouteDef(
      Routes.drawerView,
      page: _i7.DrawerView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i8.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i9.SignupView,
    ),
    _i1.RouteDef(
      Routes.verifyView,
      page: _i10.VerifyView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.CoursesView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.CoursesView(),
        settings: data,
      );
    },
    _i3.DashboardView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.DashboardView(),
        settings: data,
      );
    },
    _i4.TeachersView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.TeachersView(),
        settings: data,
      );
    },
    _i5.SettingsView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SettingsView(),
        settings: data,
      );
    },
    _i6.UploadCoursesView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.UploadCoursesView(),
        settings: data,
      );
    },
    _i7.DrawerView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DrawerView(),
        settings: data,
      );
    },
    _i8.LoginView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.LoginView(),
        settings: data,
      );
    },
    _i9.SignupView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SignupView(),
        settings: data,
      );
    },
    _i10.VerifyView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.VerifyView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.coursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeachersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.teachersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.uploadCoursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDrawerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.drawerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.coursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeachersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.teachersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUploadCoursesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.uploadCoursesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDrawerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.drawerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
