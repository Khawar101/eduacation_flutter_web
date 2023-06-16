// ignore_for_file: unused_import

import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.09,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: 'Create an account',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      const SizedBox(height: 18),
                      const CustomText(
                          text: 'Please enter your name,email or password',
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 18),
                      CustomTextField(
                        hintText: 'you@example.com',
                        prefix: const Icon(Icons.email),
                        validator: (value) {
                          // adminEmail= value!;
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      CustomTextField(
                        hintText: 'At least 8 characters',
                        validator: (value) {
                          return null;
                        },
                        isObscureText: viewModel.visibleCheck,
                        prefix: GestureDetector(
                          onTap: viewModel.visible_check,
                          child: Icon(
                            viewModel.visibleCheck == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          // allowAdminToLogin();
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: CustomText(
                                  text: 'Create account',
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
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
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'icons/google-48.png',
                                  scale: 2,
                                ),
                                const SizedBox(width: 6),
                                Visibility(
                                  visible: screenWidth >= 700,
                                  child: const CustomText(
                                      text: 'Google',
                                      size: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'icons/facebook-48.png',
                                  scale: 2,
                                ),
                                const SizedBox(width: 6),
                                Visibility(
                                  visible: screenWidth >= 700,
                                  child: const CustomText(
                                      text: 'Facebook',
                                      size: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black54, fontSize: 12)),
                          TextSpan(
                              text: " Sign in",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.lightBlue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))
                        ])),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.black,
              )
            ],
          ),
        ));
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
