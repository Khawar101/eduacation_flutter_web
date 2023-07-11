import 'package:education_flutter_web/ui/views/e_book/upload_ebook/upload_ebook_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../e_book_widgets/ebook_card_page.dart';

class EbookScreen3 extends StackedView<UploadebookViewModel> {
  final bool review;
  const EbookScreen3(this.review, {Key? key}) : super(key: key);
  @override
  void onViewModelReady(UploadebookViewModel viewModel) {
    viewModel.lectures = viewModel.ebookData.lecture ?? [];
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    UploadebookViewModel viewModel,
    Widget? child,
  ) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (() {
                  if (width < 650) {
                    return 1;
                  } else if (width < 1000) {
                    return 2;
                  } else {
                    return 3;
                  }
                }()),
                mainAxisExtent: 202,
                //  childAspectRatio: 1/4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: review
                ? viewModel.lectures.length
                : viewModel.lectures.length + 1,
            itemBuilder: (BuildContext context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: index == viewModel.lectures.length
                    ? IconButton(
                        onPressed: () {
                          viewModel.ebookAddLecture(context);
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 50,
                        ),
                      )
                    : InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          viewModel.ebookWatchvideo(
                              context, viewModel.lectures[index].videoUrl);
                        },
                        child: ebookCardPage(context, viewModel.lectures[index],
                            () {
                          viewModel.ebookRemoveLecture(index);
                        }),
                      ),
              );
            }),
        //
      ],
    );
  }

  @override
  UploadebookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadebookViewModel();
}
