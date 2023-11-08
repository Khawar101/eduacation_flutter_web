// ignore_for_file: unused_import, unused_field
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/pop_up_menu.dart';
import 'package:education_flutter_web/utils/loading.dart';
import '../../widgets/common/sized_text/sized_text.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/Model/CoursesModel.dart';
import '../../../services/courses_service.dart';
import '../../../app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class CoursesViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  final _coursesService = locator<CoursesService>();
  CoursesService get coursesService => _coursesService;

  nextPage() {
    _coursesService.uploadCoursePage(notifyListeners, 1);
  }

  editCourse(data) {
    _coursesService.courseData = data;
    _coursesService.uploadCoursePage(notifyListeners, 1);
  }

  showCourseDetail(data) {
    _coursesService.courseData = data;
    _coursesService.uploadCoursePage(notifyListeners, 2);
  }

  deleteCourse(key) {
    _coursesService.deleteCourseService(key);
  }

  publishCourse(key) {
    _coursesService.publishCourseService(key);
    notifyListeners();
  }

  draftCourse(key) {
    _coursesService.draftCourseService(key);
    notifyListeners();
  }
}
