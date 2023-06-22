
import 'package:education_flutter_web/ui/views/auth/signup/signup_view.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';

class ResetSuccess extends StatefulWidget {
  const ResetSuccess({super.key});

  @override
  State<ResetSuccess> createState() => _ResetSuccessState();
}

class _ResetSuccessState extends State<ResetSuccess> with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline_rounded, size: 200, color: Colors.green,),
                      const SizedBox(height: 18),
                      const CustomText(
                          text: 'Password Reset Successfully',
                          size: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                      const SizedBox(height: 18),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupView()));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff4873a6).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: CustomText(
                                  text: 'Sign in Again',
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.47,
                color: Color(0xff4873a6).withOpacity(0.7),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/log.png",
                      height: MediaQuery.of(context).size.height * 1,
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