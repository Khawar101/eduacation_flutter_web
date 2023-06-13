// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/common/custom_text_field/custom_text_field.dart';
import '../../../widgets/common/icon_text_field/icon_text_field.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_4 extends StackedView<UploadCoursesViewModel> {
  const UploadView_4({Key? key}) : super(key: key);

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
                color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'e.g: Free Programming Courses',
          maxLines: 1,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextField(
              titleText: "CATEGORY",
              icon: Icons.category,
              prefix: Icon(
                Icons.category,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              width: width / 2.5,
              hintText: 'e.g: Free Programming Courses',
            ),
            IconTextField(
              titleText: "Price",
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
        Text("Description",
            style: GoogleFonts.ibmPlexSans(
                color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        CustomTextField(
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
