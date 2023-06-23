// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_2.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_4.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_5.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/rating_cont.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'upload_courses_viewmodel.dart';

class CourseDetails extends StackedView<UploadCoursesViewModel> {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadCoursesViewModel viewModel,
    Widget? child,
  ) {
     return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                    text: viewModel.courseData.title.toString(),
                    color: Colors.black),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      const ButtonText(text: "Price:", color: Colors.black),
                      SmallText(
                          text: " ${viewModel.courseData.price}\$ ",
                          color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ButtonText(text: "Catogery:", color: Colors.black),
                    SmallText(
                        text: viewModel.courseData.category.toString(),
                        color: Colors.black),
                  ],
                ),
                horizontalSpaceLarge,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ButtonText(text: "Duration:", color: Colors.black),
                    SmallText(
                        text: viewModel.courseData.duration.toString(),
                        color: Colors.black),
                  ],
                ),
              ],
            ),
            verticalSpaceSmall,
            const ButtonText(text: "Description:", color: Colors.black),
            SmallText(
                color: Colors.black,
                text: viewModel.courseData.description.toString()),
            verticalSpaceSmall,
            const StarText(
              text: 'Lectures',
            ),
            const UploadView_4(),
            verticalSpaceSmall,
            const StarText(
              text: 'Assignments',
            ),
            const UploadView_5(),
            verticalSpaceSmall,
            const StarText(
              text: 'FAQ',
            ),
            const UploadView_2(),
            verticalSpaceSmall,
            Container(
              height: 150,
              child: ScrollConfiguration(
                behavior:MyCustomScrollBehavior(),
                child: ListView.builder(
                    itemCount: 500,
                    // shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100, color: Colors.red,
                          // width: MediaQuery.of(context).size.width*1,
                          child: Text("djkdjddd"),
                        ),
                      );
                    }),
              ),
            ),
     
            SizedBox(
              height: 60,
            )
          ],
        ),
      // ),
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
 class MyCustomScrollBehavior extends MaterialScrollBehavior {
      // Override behavior methods and getters like dragDevices
      @override
      Set<PointerDeviceKind> get dragDevices => { 
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
    }