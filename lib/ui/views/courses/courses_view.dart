import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_courses_view.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/common/reating.dart';
import 'courses_viewmodel.dart';

class CoursesView extends StackedView<CoursesViewModel> {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CoursesViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.pageNo == 0) {
      return Column(
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: viewModel.nextPage,
                  child: const Text("Create Course")),
              horizontalSpaceSmall
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: viewModel.coursesData.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisExtent: 260,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                var data = viewModel.coursesData[index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(data["image"].toString()),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right:8.0,top:8.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              data["title"].toString(),
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                            reating(data["rating"], data["reated"]),
                            CustomText(
                                text: "\$${data["price"]}",
                                size: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return const UploadCoursesView();
    }
  }

  @override
  CoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoursesViewModel();
}
