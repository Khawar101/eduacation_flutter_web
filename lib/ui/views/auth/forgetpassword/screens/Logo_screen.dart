// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 701
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 1,
            //color: Color(0xff4873a6).withOpacity(0.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/log.png",
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                CustomText(
                    text: 'Welcome to the Future',
                    size: screenWidth > 850 ? 24 : 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 19, 88, 62)),
                const SizedBox(height: 18),
                CustomText(
                    text: 'Kindly SignUp to use all the features of the app',
                    size: screenWidth > 850 ? 18 : 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 16, 65, 138)),
              ],
            ),
          )
        : Container();
  }
}
