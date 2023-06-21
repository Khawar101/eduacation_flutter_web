import 'package:education_flutter_web/ui/common/ui_helpers.dart';
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
      return Column(
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: viewModel.nextPage,
                  child: const Text("Create Course")),
              horizontalSpaceSmall
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: viewModel.coursesBuilder())),
        ],
      );
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
