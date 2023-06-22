// ignore_for_file: unused_import, unused_field

import 'dart:developer';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/pop_up_menu.dart';
import 'package:education_flutter_web/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/Model/CoursesModel.dart';
import '../../../services/courses_service.dart';
import '../../widgets/common/sized_text/sized_text.dart';

class CoursesViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  final coursesService = locator<CoursesService>();

  var pageNo = 0;
  nextPage() {
    pageNo += 1;
    notifyListeners();
  }

  backPage() {
    pageNo -= 1;
    notifyListeners();
  }

  editCourse() {}
  deleteCourse() {}
  publishCourse() {}
  draftCourse() {}
}
