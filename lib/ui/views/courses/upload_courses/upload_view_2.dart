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
  void onViewModelReady(UploadCoursesViewModel viewModel) {
    viewModel.faq = viewModel.courseData.fAQ ?? [];
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    UploadCoursesViewModel viewModel,
    Widget? child,
  ) {
     var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(text: "FAQs", color: Colors.black),
                  verticalSpaceTiny,
                  SizedBox(
                    width: width/1.5,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: BigSubText(
                          text:
                              "Everything you need to know about the product and how it works.Can't find an answer?Please chat to your student."),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    viewModel.addQuestion(context);
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
          ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.faq.length,
              itemBuilder: (BuildContext context, int index) {
                return expend_tile(viewModel, index);
              }),
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
