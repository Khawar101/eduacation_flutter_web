import 'package:education_flutter_web/ui/views/auth/forgetpassword/screens/reset_success.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/common/custom_text_field/custom_text_field.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';
import 'Logo_screen.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        //backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1,
                width: screenWidth>700?screenWidth * 0.5:screenWidth*1,
                //color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.09,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: 'Reset Password',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      const SizedBox(height: 18),
                      const CustomText(
                          text: 'Please type your new password of 8 characters',
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                      const SizedBox(height: 18),
                      CustomTextField(
                        hintText: 'Type 8 Characters Password',
                        validator: (value) {
                          return null;
                        },
                        //isObscureText: viewModel.visibleCheck,
                        prefix: GestureDetector(
                          //onTap: viewModel.visible_check,
                          child: Icon(
                            Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      CustomTextField(
                        hintText: 'Re-Type Password',
                        validator: (value) {
                          return null;
                        },
                        //isObscureText: viewModel.visibleCheck,
                        prefix: GestureDetector(
                          //onTap: viewModel.visible_check,
                          child: Icon(
                            Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetSuccess()));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: CustomText(
                                  text: 'Reset Password',
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const LogoScreen(),
              
            ],
          ),
        ));
  }
}
