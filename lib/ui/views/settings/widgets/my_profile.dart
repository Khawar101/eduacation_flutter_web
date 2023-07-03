// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../settings_viewmodel.dart';

class MyProfile extends StackedView<SettingsViewModel> {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    //  var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height - 50;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Profile",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Container(
              //  height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: const Color(0xff4873a6).withOpacity(0.7),
                      width: 1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.red,
                          backgroundImage: NetworkImage(
                              viewModel.userdata.profile.toString()),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              viewModel.userdata.username??"",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              viewModel.userdata.userType??"",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            // Text(
                            //   viewModel.userdata.address ?? "",
                            //   style: GoogleFonts.ibmPlexSans(
                            //       color: Colors.black45,
                            //       fontSize: 12,
                            //       fontWeight: FontWeight.w400),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    tabSection()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: const Color(0xff4873a6).withOpacity(0.7),
                      width: 1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Personal Information",
                          style: GoogleFonts.ibmPlexSans(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        tabSection(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Texts(
                          question: "First Name",
                          answer: viewModel.userdata.firstName ?? "",
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Texts(
                          question: "Last Name",
                          answer: viewModel.userdata.lastName ?? "",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Texts(
                          question: "Email Addres",
                          answer: viewModel.userdata.email ?? "",
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Texts(
                          question: "Phone",
                          answer: viewModel.userdata.phoneNo ?? "",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Texts(
                      question: "Bio",
                      answer: "Teacher",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: const Color(0xff4873a6).withOpacity(0.7),
                      width: 1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Region",
                          style: GoogleFonts.ibmPlexSans(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        tabSection(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Texts(
                          question: "Country",
                          answer: viewModel.userdata.country ?? "",
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Texts(
                          question: "City",
                          answer: viewModel.userdata.city ?? "",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Texts(
                      question: "Address",
                      answer: viewModel.userdata.address ?? "",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}

Widget tabSection() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color(0xff4873a6).withOpacity(0.7), width: 1)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Edit",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black45,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 3),
            const Icon(
              Icons.drive_file_rename_outline_outlined,
              color: Colors.black45,
              size: 14,
            )
          ]),
    ),
  );
}

class Texts extends StatelessWidget {
  final question;
  final answer;
  const Texts({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            question,
            style: GoogleFonts.ibmPlexSans(
              color: Colors.black45,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            answer,
            style: GoogleFonts.ibmPlexSans(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
