// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/common/icon_text_field/icon_text_field.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_3 extends StackedView<UploadCoursesViewModel> {
  const UploadView_3({Key? key}) : super(key: key);

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
       
      ],
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
