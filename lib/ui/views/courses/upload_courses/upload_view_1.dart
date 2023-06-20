// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/common/custom_text_field/custom_text_field.dart';
import '../../../widgets/common/icon_text_field/icon_text_field.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_1 extends StackedView<UploadCoursesViewModel> {
  const UploadView_1({Key? key}) : super(key: key);

  @override
  void onViewModelReady(UploadCoursesViewModel viewModel) {
    viewModel.categoryCtrl.text = viewModel.courseData.category??"";
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
      children: [
        const SizedBox(height: 30),
        Text("Courses Title",
            style: GoogleFonts.ibmPlexSans(
                color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'e.g: Free Programming Courses',
          maxLines: 1,
          controller: viewModel.titleCtrl,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextField(
              titleText: "CATEGORY",
              icon: Icons.category,
              controller: viewModel.categoryCtrl,
              onChanged: (s) {
                viewModel.getCategoryValue(s);
              },
              prefix: Icon(
                Icons.category,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              width: width / 2.5,
              hintText: 'e.g: Free Programming Courses',
            ),
            IconTextField(
              titleText: "Chapter",
              controller: viewModel.chapterCtrl,
              width: width / 2.5,
              prefix: Icon(
                Icons.price_change,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              hintText: 'e.g: Free Programming Courses',
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Text("Description",
                style: GoogleFonts.ibmPlexSans(
                    color: Colors.grey, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: viewModel.descriptionCtrl,
          hintText: 'e.g: Free Programming Courses',
          maxLines: 4,
        ),
      ],
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
