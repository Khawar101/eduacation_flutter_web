import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../forgetpassword/screens/Logo_screen.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        //backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: screenWidth > 700 ? screenWidth * 0.5 : screenWidth * 1,
            //color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.09,
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
                  CustomTextField(
                    hintText: 'you@example.com',
                    controller: viewModel.emailCTRL,
                    prefix: const Icon(Icons.email),
                    validator: (value) {
                      // adminEmail= value!;
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  CustomTextField(
                    controller: viewModel.passwordCTRL,
                    hintText: 'At least 8 characters',
                    validator: (value) {
                      return null;
                    },
                    isObscureText: viewModel.visibleCheck,
                    prefix: InkWell(
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      onTap: viewModel.visible_check,
                      child: Icon(
                        viewModel.visibleCheck == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: viewModel.navigateForget,
                        child: SmallText(
                          text: "Forgot password",
                          color: const Color(0xff4873a6).withOpacity(0.7),
                        ),
                      )),
                  verticalSpaceSmall,
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      viewModel.logIN(context);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xff4873a6).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: CustomText(
                              text: 'Signin',
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
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff4873a6).withOpacity(0.7),
                              ),
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
                      ),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: screenWidth * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  style: BorderStyle.solid),
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
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      onTap: viewModel.navigateSignup,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.ibmPlexSans(
                                color: Colors.black54, fontSize: 12)),
                        TextSpan(
                            text: " Sign up",
                            style: GoogleFonts.ibmPlexSans(
                                color: Colors.lightBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500))
                      ])),
                    ),
                  )
                ],
              ),
            ),
          ),
          const LogoScreen(),
        ],
      ),
    ));
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
