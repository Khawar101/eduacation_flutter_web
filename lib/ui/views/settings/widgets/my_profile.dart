// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
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
                        const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.red,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mudasir Ali",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Team Manager",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Leeds,Pakistan",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
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
                        const Texts(
                          question: "First Name",
                          answer: "Mudassir",
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        const Texts(
                          question: "Last Name",
                          answer: "Ali",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Texts(
                          question: "Email Addres",
                          answer: "xyz124@gmail.com",
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        const Texts(
                          question: "Phone",
                          answer: "+0912345566",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Texts(
                      question: "Bio",
                      answer: "Team Manager",
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
                          "Address",
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
                        const Texts(
                          question: "Country",
                          answer: "Pakistan",
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        const Texts(
                          question: "City",
                          answer: "Lahore",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Texts(
                          question: "Postal Code",
                          answer: "ERT 2354",
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        const Texts(
                          question: "TAX ID",
                          answer: "AS4566765",
                        ),
                      ],
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
