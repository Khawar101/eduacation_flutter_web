// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/expand_tile.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "FAQs", color: Colors.black),
                  verticalSpaceTiny,
                  BigSubText(
                      text:
                          "Everything you need to know about the product and how it works.Can't find an answer?Please chat to your student."),
                ],
              ),
              IconButton(
                  onPressed: () {
                    viewModel.addLectureAlert(context);
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 30,
                  ))
            ],
          ),
          verticalSpaceSmall,
          const Divider(
            color: Colors.grey,
          ),
          expend_tile('title', 'subtitle')
        ],
      ),
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
