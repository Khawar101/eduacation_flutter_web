// ignore_for_file: camel_case_types

import 'package:education_flutter_web/services/Model/ratingModel.dart';
import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_2.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_4.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_5.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/bottomBtn.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/rating_cont.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../utils/loading.dart';
import 'upload_courses_viewmodel.dart';

class CourseDetails extends StackedView<UploadCoursesViewModel> {
  const CourseDetails({Key? key}) : super(key: key);

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
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width / 2,
                child: BigText(
                    text: viewModel.courseData.title.toString(),
                    color: Colors.black),
              ),
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
          const UploadView_4(true),
          verticalSpaceSmall,
          const StarText(
            text: 'Assignments',
          ),
          const UploadView_5(true),
          verticalSpaceSmall,
          const StarText(
            text: 'FAQ',
          ),
          const UploadView_2(),
          verticalSpaceSmall,
          const StarText(
            text: 'Rating',
          ),
          verticalSpaceSmall,
          SizedBox(
            height: 150,
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: StreamBuilder<List<RatingModel>>(
                stream: viewModel.rateingService
                    .ratingStream(viewModel.courseData.publishDate),
                builder: (BuildContext context,
                    AsyncSnapshot<List<RatingModel>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading();
                  }
                  if (snapshot.data!.isEmpty) {
                    return const Center(child: Text("No rating yet..."));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      // shrinkWrap: true,
                      // physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        // RatingModel data = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ratingCont(context, snapshot.data![index]),
                        );
                      });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
           Center(
             child: SizedBox(width: 200,
               child: bottomBtn(context, "Cancel", () {
                      viewModel.coursesService.cancelPage();
                    }),
             ),
           ),
          const SizedBox(
            height: 40,
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
