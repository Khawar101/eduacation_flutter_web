import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StackedView<SplashScreenViewModel> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(SplashScreenViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.checkIfUserLoggedIn();
  }

  @override
  Widget builder(
    BuildContext context,
    SplashScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xffe5f1f8),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
                child: Text(
              'Education\nApp',
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            )),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber),
                alignment: FractionalOffset.topRight,
                transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -360),
                child: const Center(
                    child: Icon(
                  Icons.book,
                  color: Colors.white,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.8,
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff4873a6).withOpacity(0.7),
                ),
                child: Center(
                    child: Image.asset(
                  'assets/icons/graduation-cap.png',
                  width: 30,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.4),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber),
                child: Center(
                    child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)),
                  child: Center(
                      child: Text(
                    'A+',
                    style: GoogleFonts.ibmPlexSans(
                      color: Colors.white,
                    ),
                  )),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.39,
                  top: MediaQuery.of(context).size.height * 0.58),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.grey),
                child: Center(
                    child: Image.asset(
                  'assets/icons/react-native-50.png',
                  width: 40,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.8,
                  top: MediaQuery.of(context).size.height * 0.74),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color(0xff4873a6).withOpacity(0.7),
                ),
                child: const Center(
                    child: Icon(
                  Icons.phone_android_sharp,
                  color: Colors.white,
                  size: 18,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.86),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orangeAccent),
                alignment: FractionalOffset.topRight,
                transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / -360),
                child: Center(
                    child: Image.asset(
                  'assets/icons/book-64.png',
                  width: 27,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SplashScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashScreenViewModel();
}
