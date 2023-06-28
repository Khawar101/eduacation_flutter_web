// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/faqCard.dart';
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
                    width: width / 1.5,
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
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.faq.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 1000,
                mainAxisExtent: 160,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      color: Colors.white,
                    ),
                    child: faqCard(viewModel, index, context));
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
