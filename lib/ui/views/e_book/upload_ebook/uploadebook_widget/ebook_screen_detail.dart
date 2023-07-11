import 'package:education_flutter_web/ui/views/e_book/e_book_widgets/ebook_btm_btn.dart';
import 'package:education_flutter_web/ui/views/e_book/upload_ebook/upload_ebook_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../common/ui_helpers.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';
import 'ebook_screen_2.dart';
import 'ebook_screen_3.dart';

class EbookDetails extends StackedView<UploadebookViewModel> {
  const EbookDetails({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadebookViewModel viewModel,
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
                    text: viewModel.ebookData.title.toString(),
                    color: Colors.black),
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
                      text: viewModel.ebookData.category.toString(),
                      color: Colors.black),
                ],
              ),
              horizontalSpaceLarge,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ButtonText(text: "Price:", color: Colors.black),
                  SmallText(
                      text:"${viewModel.ebookData.price}\$",
                      color: Colors.black),
                ],
              ),
            ],
          ),
          verticalSpaceSmall,
          const ButtonText(text: "Description:", color: Colors.black),
          SmallText(
              color: Colors.black,
              text: viewModel.ebookData.description.toString()),
          verticalSpaceSmall,
          const StarText(
            text: 'Lectures',
          ),
          const EbookScreen3(true),
          verticalSpaceSmall,
          
          const StarText(
            text: 'FAQ',
          ),
          const EbookScreen2(),
          verticalSpaceSmall,
          const StarText(
            text: 'Rating',
          ),
         
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 200,
              child: ebookBottomBtn(context, "Cancel", () {
                viewModel.ebookService.cancelPage();
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
  UploadebookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadebookViewModel();
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
