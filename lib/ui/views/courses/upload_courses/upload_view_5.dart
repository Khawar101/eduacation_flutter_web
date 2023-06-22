// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_5 extends StackedView<UploadCoursesViewModel> {
  const UploadView_5({Key? key}) : super(key: key);
  @override
  void onViewModelReady(UploadCoursesViewModel viewModel) {
    viewModel.assigments = viewModel.courseData.assigment ?? [];
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    UploadCoursesViewModel viewModel,
    Widget? child,
  ) {
    // var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (() {
                  if (MediaQuery.of(context).size.width < 600) {
                    return 1;
                  } else if (MediaQuery.of(context).size.width < 1000) {
                    return 2;
                  } else {
                    return 3;
                  }
                }()),
                mainAxisExtent: 202,
                //  childAspectRatio: 1/4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: viewModel.assigments.length + 1,
            itemBuilder: (BuildContext context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: index == viewModel.assigments.length
                    ? IconButton(
                        onPressed: () {
                          viewModel.addAssigment(context);
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 50,
                        ),
                      )
                    : Card_Page(context, viewModel.assigments[index], () {
                        viewModel.removeAssigment(index);
                      }),
              );
            }),
        //
      ],
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
