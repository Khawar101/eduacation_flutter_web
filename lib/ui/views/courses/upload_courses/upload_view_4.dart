// ignore_for_file: camel_case_types, unused_local_variable, unused_import

import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'upload_courses_viewmodel.dart';

class UploadView_4 extends StackedView<UploadCoursesViewModel> {
  const UploadView_4({Key? key}) : super(key: key);
  @override
  void onViewModelReady(UploadCoursesViewModel viewModel) {
    viewModel.lectures = viewModel.courseData.lecture ?? [];
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    UploadCoursesViewModel viewModel,
    Widget? child,
  ) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (() {
                  if (width < 650) {
                    return 1;
                  } else if (width < 1000) {
                    return 2;
                  } else {
                    return 3;
                  }
                }()),
                mainAxisExtent: 202,
                //  childAspectRatio: 1/4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: viewModel.lectures.length + 1,
            itemBuilder: (BuildContext context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: index == viewModel.lectures.length
                    ? IconButton(
                        onPressed: () {
                          viewModel.addLecture(context);
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 50,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          viewModel.watchvideo(
                              context, viewModel.lectures[index].videoUrl);
                        },
                        child:
                            Card_Page(context, viewModel.lectures[index], () {
                          viewModel.removeLecture(index);
                        }),
                      ),
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
