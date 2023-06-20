import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'verify_viewmodel.dart';

class VerifyView extends StackedView<VerifyViewModel> {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VerifyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.09,
                // vertical: MediaQuery.of(context).size.height * 0.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                      text: 'Wellcome back!',
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  const SizedBox(height: 18),
                  const CustomText(
                      text: 'Please enter your valid email or password',
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < viewModel.codes.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              viewModel.codes[i],
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  verticalSpaceSmall,
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // viewModel.logIN(context);
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xff4873a6).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: CustomText(
                                text: 'Confirm OTP',
                                size: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black12,
                        ),
                      ),
                      SizedBox(width: 10),
                      CustomText(
                          text: 'or',
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          color: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
          ),
        ));
  }

  @override
  VerifyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyViewModel();
}
