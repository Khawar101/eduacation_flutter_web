import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'e_book_viewmodel.dart';
import 'e_book_widgets/ebook_builders.dart';

class EBookView extends StackedView<EBookViewModel> {
  const EBookView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EBookViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.ebookServices.ebookPage == 0) {
      return Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: ebookBuilder(viewModel)
                  )
                  ),
        ],
      );
    } else if (viewModel.ebookServices.ebookPage == 1) {
      // return      const UploadCoursesView();
      return Container();
    } else {
      return SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.009,
            ),
            // child: const CourseDetails(),
          ));
    }
  }

  @override
  EBookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EBookViewModel();
}
