// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_2 extends StackedView<UploadCoursesViewModel> {
  const UploadView_2({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadCoursesViewModel viewModel,
    Widget? child,
  ) {
    // var width = MediaQuery.of(context).size.width;
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("2nd Screen")
    ],
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
