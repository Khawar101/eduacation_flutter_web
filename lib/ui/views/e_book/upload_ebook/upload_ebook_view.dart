import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/common/sized_text/sized_text.dart';
import '../../../widgets/common/step_progress_view.dart';
import '../../courses/upload_courses/widgets/bottomBtn.dart';
import 'upload_ebook_viewmodel.dart';

class UploadebookView extends StackedView<UploadebookViewModel> {
  const UploadebookView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadebookViewModel viewModel,
    Widget? child,
  ) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - 50;

    return SizedBox(
      height: height,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.009,
            ),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      ButtonText(text: "Bundle Ebook", color: Colors.black),
                      SizedBox(width: 20),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                      SizedBox(width: 10),
                      ButtonText(text: "Create Ebook", color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 30),
                  StepProgressView(
                    curStep: viewModel.screenNo + 1,
                    titles: const ["EBooks", 'FAQ', 'pdf Books', 'Publish'],
                    width: width * 0.6,
                  ),
                  viewModel.screens[viewModel.screenNo],
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.009),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomBtn(context, "Cancel", () {
                  viewModel.ebookService.cancelPage();
                }),
                Row(
                  children: [
                    viewModel.screenNo != 0
                        ? bottomBtn(context, "Previous", () {
                            viewModel.backPage();
                          })
                        : Container(),
                    const SizedBox(width: 20),
                    viewModel.screenNo == 3
                        ? bottomBtn(context, "Publish", () {
                            viewModel.ebookPublish(true);
                          })
                        : bottomBtn(context, "Next", () {
                            viewModel.validation(context);
                          }),
                    const SizedBox(width: 20),
                    viewModel.screenNo == 3
                        ? bottomBtn(context, "Draft", () {
                            viewModel.ebookPublish(false);
                          })
                        : Container(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  UploadebookViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadebookViewModel();
}
