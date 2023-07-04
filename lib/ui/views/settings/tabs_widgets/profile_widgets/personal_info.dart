import 'package:education_flutter_web/ui/views/settings/tabs_widgets/profile_widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'btnsection.dart';

Widget personalInformation(viewModel, context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: const Color(0xff4873a6).withOpacity(0.7), width: 1)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
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
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              Texts(
                question: "Phone",
                answer: viewModel.userdata.phoneNo ?? "",
                viewModel: viewModel,
                cTRL: viewModel.phoneController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Texts(
                question: "Bio",
                answer: viewModel.userdata.bio ?? "",
                viewModel: viewModel,
                cTRL: viewModel.bioController,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              Texts(
                question: "Address",
                answer: viewModel.userdata.address ?? "",
                viewModel: viewModel,
                cTRL: viewModel.addressController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Texts(
                question: "City",
                answer: viewModel.userdata.city ?? "",
                viewModel: viewModel,
                cTRL: viewModel.cityController,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              Texts(
                question: "Country",
                answer: viewModel.userdata.country ?? "",
                viewModel: viewModel,
                cTRL: viewModel.countryController,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
