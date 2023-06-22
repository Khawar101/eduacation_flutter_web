import 'package:education_flutter_web/ui/views/auth/forgetpassword/screens/forget_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/common/custom_text_field/custom_text_field.dart';
import '../../../widgets/common/sized_text/sized_text.dart';
import 'forgetpassword_viewmodel.dart';

class ForgetpasswordView extends StackedView<ForgetpasswordViewModel> {
  const ForgetpasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetpasswordViewModel viewModel,
    Widget? child,
  ) {
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
                          text: 'Forget Password',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      const SizedBox(height: 18),
                      const CustomText(
                          text: 'Please enter your email to get OTP',
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                      const SizedBox(height: 18),
                      CustomTextField(
                        hintText: 'you@example.com',
                        prefix: const Icon(Icons.email),
                        validator: (value) {
                          // adminEmail= value!;
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetOtp()));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: CustomText(
                                  text: 'Send OTP',
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 1,
                color: Color(0xff4873a6).withOpacity(0.7),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/log.png",
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    const CustomText(
                        text: 'Welcome to the Future',
                        size: 24,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 139, 238, 200)),
                    const SizedBox(height: 18),
                    const CustomText(
                        text:
                            'Kindly SignUp to use all the features of the app',
                        size: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 216, 247, 131)),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  @override
  ForgetpasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgetpasswordViewModel();
}
