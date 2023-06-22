
import 'package:flutter/material.dart';
import '../../../../common/ui_helpers.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';
import 'new_password.dart';

class ForgetOtp extends StatefulWidget {
  const ForgetOtp({super.key});

  @override
  State<ForgetOtp> createState() => _ForgetOtpState();
}

class _ForgetOtpState extends State<ForgetOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
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
                          text: 'Verify OTP',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      const SizedBox(height: 18),
                      const CustomText(
                          text: 'Please enter the OTP received on your email',
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 0; i < 6; i++)
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
                                  "",
                                  //viewModel.codes[i],
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPassword()));
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
                      height: MediaQuery.of(context).size.height*0.5,
                      width: MediaQuery.of(context).size.width*0.5,
                    ),
                    const CustomText(
                          text: 'Welcome to the Future',
                          size: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 139, 238, 200)),
                      const SizedBox(height: 18),
                      const CustomText(
                          text: 'Kindly SignUp to use all the features of the app',
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
}