// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/common/app_colors.dart';
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
    viewModel.titleCtrl.text = viewModel.courseData.title ?? "";
    viewModel.categoryCtrl.text = viewModel.courseData.category ?? "";
    viewModel.chapterCtrl.text = viewModel.courseData.chapter ?? "";
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
      // final _formKey = GlobalKey<FormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text("Courses Title",
            style: GoogleFonts.ibmPlexSans(
                 color: kcPrimaryColor, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'Enter your title...',
          maxLines: 1,
          controller: viewModel.titleCtrl,
         
          onChanged: (s) {
            viewModel.getTitleValue(s);
            //  if (_formKey.currentState!.validate()) {
                            
            //               }
          },
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                  hintText: 'Enter your category...',
                ),
               const SizedBox(height: 30),
            IconTextField(
              titleText: "Chapter",
              controller: viewModel.chapterCtrl,
              onChanged: (s) {
                viewModel.getChapterValue(s);
              },
              width: width / 2.5,
              prefix: Icon(
                Icons.price_change,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              hintText: 'Enter your chapter...',
            ),
             ],
            ),
                          coverBtn( 0, "", (){},context),

          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Text("Description",
                style: GoogleFonts.ibmPlexSans(
                     color: kcPrimaryColor, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
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


Widget coverBtn( progress, url, fun,context) {
  return InkWell(
    onTap: fun,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: url != ""
              ? 
                   DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
              : null,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      height: 160,
    width: MediaQuery.of(context).size.width*0.15,
      child: url == ""
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                progress >= 3
                    ? CircularProgressIndicator(
                        value: progress / 100,
                      )
                    : Column(
                        children: [
                          const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          Text("Cover Photo")
                        ],
                      ),
              ],
            )
          : null,
    ),
  );
}
