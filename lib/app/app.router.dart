// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const coursesView = '/courses-view';

  static const dashboardView = '/dashboard-view';

  static const teachersView = '/teachers-view';

  static const settingsView = '/settings-view';

  static const uploadCoursesView = '/upload-courses-view';

  static const drawerView = '/drawer-view';

  static const all = <String>{
    coursesView,
    dashboardView,
    teachersView,
    settingsView,
    uploadCoursesView,
    drawerView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.CoursesView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.CoursesView(),
        settings: data,
      );
    },
    _i3.DashboardView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.DashboardView(),
        settings: data,
      );
    },
    _i4.TeachersView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.TeachersView(),
        settings: data,
      );
    },
    _i5.SettingsView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SettingsView(),
        settings: data,
      );
    },
    _i6.UploadCoursesView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.UploadCoursesView(),
        settings: data,
      );
    },
    _i7.DrawerView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DrawerView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i9.NavigationService {
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
}
