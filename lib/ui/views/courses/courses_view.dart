import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_courses_view.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_6.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'courses_viewmodel.dart';
import 'widgets/coursesBuilder.dart';

class CoursesView extends StackedView<CoursesViewModel> {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CoursesViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.coursesService.coursesPage == 0) {
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
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: coursesBuilder(viewModel))),
        ],
      );
    } else if (viewModel.coursesService.coursesPage == 1) {
      return const UploadCoursesView();
    } else {
      return SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.009,
            ),
            child: const CourseDetails(),
          ));
    }
  }

  @override
  CoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoursesViewModel();
}
