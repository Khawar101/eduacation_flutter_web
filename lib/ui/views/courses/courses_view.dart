import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_courses_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'courses_viewmodel.dart';

class CoursesView extends StackedView<CoursesViewModel> {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CoursesViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.pageNo == 0) {
      return ElevatedButton(
          onPressed: viewModel.nextPage, child: const Text("Create Course"));
    } else {
      return const UploadCoursesView();
    }
  }

  @override
  CoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoursesViewModel();
}
