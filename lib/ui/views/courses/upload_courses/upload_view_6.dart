// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_6 extends StackedView<UploadCoursesViewModel> {
  const UploadView_6({Key? key}) : super(key: key);

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
            itemCount: 4,
            itemBuilder: (BuildContext context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Card_Page(context),
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
