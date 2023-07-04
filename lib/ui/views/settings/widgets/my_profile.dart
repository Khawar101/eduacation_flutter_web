// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../settings_viewmodel.dart';
import 'edit_Text_field.dart';

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
                        viewModel.basicData
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 20,
                                      width: 200,
                                      child: editTextField(viewModel,
                                          viewModel.usernameController)),
                                  const SizedBox(height: 10),
                                  Text(
                                    viewModel.userdata.userType ?? "",
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.black45,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    viewModel.userdata.username ?? "",
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    viewModel.userdata.userType ?? "",
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.black45,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    InkWell(
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      onTap: viewModel.basicData
                          ? () {
                              viewModel.basicDataUpdate(context);
                            }
                          : viewModel.basicDataEdit,
                      child: btnSection(viewModel.basicData),
                    )
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
                        InkWell(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onTap: viewModel.personalData
                                ? () {
                                    viewModel.personalDataUpdate(context);
                                  }
                                : viewModel.personalDataEdit,
                            child: btnSection(viewModel.personalData)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Texts(
                          question: "First Name",
                          answer: viewModel.userdata.firstName ?? "",
                          viewModel: viewModel,
                          cTRL: viewModel.firstNameController,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Texts(
                          question: "Last Name",
                          answer: viewModel.userdata.lastName ?? "",
                          viewModel: viewModel,
                          cTRL: viewModel.lastNameController,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Texts(
                          question: "Email Addres",
                          answer: viewModel.userdata.email ?? "",
                          viewModel: viewModel,
                          cTRL: viewModel.emailController,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Texts(
                          question: "Phone",
                          answer: viewModel.userdata.phoneNo ?? "",
                          viewModel: viewModel,
                          cTRL: viewModel.phoneController,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Texts(
                      question: "Bio",
                      answer: viewModel.userdata.bio ?? "",
                      viewModel: viewModel,
                      cTRL: viewModel.bioController,
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
                        InkWell(
                          mouseCursor: MaterialStateMouseCursor.clickable,
                          onTap: viewModel.regionData
                              ? () {
                                  viewModel.regionDataUpdate(context);
                                }
                              : viewModel.regionDataEdit,
                          child: btnSection(viewModel.regionData),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Texts(
                          question: "Country",
                          answer: viewModel.userdata.country ?? "",
                          viewModel: viewModel,
                          cTRL: viewModel.countryController,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Texts(
                          question: "City",
                          answer: viewModel.userdata.city ?? "",
                          viewModel: viewModel,
                          cTRL: viewModel.cityController,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Texts(
                      question: "Address",
                      answer: viewModel.userdata.address ?? "",
                      viewModel: viewModel,
                      cTRL: viewModel.addressController,
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

Widget btnSection(
  bool save,
) {
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
              save ? "save" : "Edit",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black45,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 3),
            Icon(
              save ? Icons.save : Icons.drive_file_rename_outline_outlined,
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
  final SettingsViewModel viewModel;
  final TextEditingController cTRL;
  const Texts(
      {super.key,
      required this.question,
      required this.answer,
      required this.viewModel,
      required this.cTRL});

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
          child: viewModel.personalData
              ? SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: editTextField(viewModel, cTRL))
              : Text(
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
