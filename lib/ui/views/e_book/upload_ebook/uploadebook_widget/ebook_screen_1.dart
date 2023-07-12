import 'package:education_flutter_web/ui/views/e_book/upload_ebook/upload_ebook_viewmodel.dart';
import 'package:education_flutter_web/ui/widgets/common/drop_down_search/books_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../common/app_colors.dart';
import '../../../../widgets/common/custom_text_field/custom_text_field.dart';
import '../../../../widgets/common/icon_text_field/icon_text_field.dart';
import '../../e_book_widgets/ebook_cover_btn.dart';

class EbookScreen1 extends StackedView<UploadebookViewModel> {
  const EbookScreen1({Key? key}) : super(key: key);

  @override
  void onViewModelReady(UploadebookViewModel viewModel) {
    viewModel.titleCtrl.text = viewModel.ebookData.title ?? "";
    viewModel.chapterCtrl.text = viewModel.ebookData.chapter ?? "";
    viewModel.getCategoryValue(viewModel.ebookData.category ?? "Adventure");
    viewModel.descriptionCtrl.text = viewModel.ebookData.description ?? "";
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
        Text("Ebook Title",
            style: GoogleFonts.ibmPlexSans(
                color: kcPrimaryColor,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        const SizedBox(height: 6),
        CustomTextField(
          hintText: 'Enter your title...',
          maxLines: 1,
          controller: viewModel.titleCtrl,
          onChanged: (s) {
            viewModel.getTitleValue(s);
          },
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    height: 50,
                    width: width / 1.8,
                    child: booksSearch(context, viewModel)),
                const SizedBox(height: 30),
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
              width: width / 1.8,
              hintText: 'Please enter Price...',
            ),
              ],
            ),
            ebookCoverBtn(viewModel.ebookService.progressshow,
                viewModel.ebookService.ebookData.coverPic, () {
              viewModel.ebookAddCoverPhoto();
            }, context),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Text("Description",
                style: GoogleFonts.ibmPlexSans(
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
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
  UploadebookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadebookViewModel();
}
