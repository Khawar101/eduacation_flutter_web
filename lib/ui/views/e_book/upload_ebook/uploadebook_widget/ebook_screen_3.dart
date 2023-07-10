import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/e_book/upload_ebook/upload_ebook_viewmodel.dart';
import 'package:education_flutter_web/ui/widgets/common/icon_text_field/icon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EbookScreen3 extends StackedView<UploadebookViewModel> {
  const EbookScreen3({Key? key}) : super(key: key);
  @override
  void onViewModelReady(UploadebookViewModel viewModel) {
    viewModel.priceCtrl.text = viewModel.ebookData.price ?? "";
    viewModel.durationCtrl.text = viewModel.ebookData.duration ?? "";
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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextField(
              textInputType: TextInputType.number,
              titleText: "Price",
              controller: viewModel.priceCtrl,
              onChanged: (s) {
                viewModel.getPriceValue(s);
              },
              icon: Icons.category,
              prefix: Icon(
                Icons.category,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              width: width / 2.5,
              hintText: 'Please enter Price...',
            ),
            verticalSpaceSmall,
            IconTextField(
              titleText: "Duration",
              controller: viewModel.durationCtrl,
              onChanged: (s) {
                viewModel.getDurationValue(s);
              },
              width: width / 2.5,
              prefix: Icon(
                Icons.price_change,
                color: const Color(0xff4873a6).withOpacity(0.7),
              ),
              hintText: 'Enter duratiuon please...',
            ),
          ],
        ),
      ],
    );
  }

  @override
  UploadebookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadebookViewModel();
}
