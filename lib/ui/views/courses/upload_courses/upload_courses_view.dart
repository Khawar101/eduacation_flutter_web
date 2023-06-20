import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/common/sized_text/sized_text.dart';
import '../../../widgets/common/step_progress_view.dart';
import 'upload_courses_viewmodel.dart';

class UploadCoursesView extends StackedView<UploadCoursesViewModel> {
  const UploadCoursesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadCoursesViewModel viewModel,
    Widget? child,
  ) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - 50;

    return SizedBox(
      height: height,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.009,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Row(
                  children: [
                    ButtonText(text: "Bundle Courses", color: Colors.black),
                    SizedBox(width: 20),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                    SizedBox(width: 10),
                    ButtonText(text: "Create Bundle", color: Colors.black),
                  ],
                ),
                const SizedBox(height: 30),
                StepProgressView(
                  curStep: viewModel.screenNo + 1,
                  titles: const [
                    "Courses",
                    'FAQ',
                    'Pricing',
                    'Lecture',
                    'Assignment',
                    'Publish'
                  ],
                  width: width * 0.6,
                ),
                viewModel.screens[viewModel.screenNo],
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.009,
              vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: const Color(0xff4873a6).withOpacity(0.7))),
                  child: const Center(
                      child: ButtonText(text: "Cancel", color: Colors.black))),
              Row(
                children: [
                  GestureDetector(
                    onTap: viewModel.backPage,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: const Color(0xff4873a6).withOpacity(0.7))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios, size: 14),
                          SizedBox(width: 6),
                          ButtonText(text: "Previous", color: Colors.black)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: viewModel.nextPage,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: const Color(0xff4873a6).withOpacity(0.7))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ButtonText(text: "Next", color: Colors.black),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          const Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
