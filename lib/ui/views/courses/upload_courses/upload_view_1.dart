// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/common/app_colors.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/cover_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/common/custom_text_field/custom_text_field.dart';
import '../../../widgets/common/drop_down_search/drop_down_category_search.dart';
import '../../../widgets/common/icon_text_field/icon_text_field.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_1 extends StackedView<UploadCoursesViewModel> {
  const UploadView_1({Key? key}) : super(key: key);

  @override
  void onViewModelReady(UploadCoursesViewModel viewModel) {
    viewModel.titleCtrl.text = viewModel.courseData.title ?? "";
    viewModel.chapterCtrl.text = viewModel.courseData.chapter ?? "";
    viewModel.getCategoryValue(viewModel.courseData.category ?? "Programming");
    viewModel.descriptionCtrl.text = viewModel.courseData.description ?? "";
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
        Text("Courses Title",
            style: GoogleFonts.ibmPlexSans(
                color: kcPrimaryColor,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'Enter your title...',
          maxLines: 1,
          controller: viewModel.titleCtrl,
          onChanged: (s) {
            viewModel.getTitleValue(s);
          },
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    height: 50,
                    width: width / 1.8,
                    child: dropDownSearch(context, viewModel)),
                const SizedBox(height: 30),
                IconTextField(
                  titleText: "Chapter",
                  controller: viewModel.chapterCtrl,
                  onChanged: (s) {
                    viewModel.getChapterValue(s);
                  },
                  width: width / 1.8,
                  prefix: Icon(
                    Icons.price_change,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  hintText: 'Enter your chapter...',
                ),
              ],
            ),
            coverBtn(viewModel.coursesService.progressshow,
                viewModel.coursesService.courseData.coverPic, () {
              viewModel.addCoverPhoto();
            }, context),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Text("Description",
                style: GoogleFonts.ibmPlexSans(
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
          ],
        ),
        const SizedBox(height: 6),
        CustomTextField(
          controller: viewModel.descriptionCtrl,
          onChanged: (s) {
            viewModel.getDescriptionValue(s);
          },
          hintText: 'Write a description...',
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
