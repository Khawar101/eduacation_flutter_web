import 'package:education_flutter_web/ui/views/settings/tabs_widgets/profile_widgets/btnsection.dart';
import 'package:education_flutter_web/ui/views/settings/tabs_widgets/profile_widgets/edit_Text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profileImage.dart';

Widget headingInfo(viewModel, context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: const Color(0xff4873a6).withOpacity(0.7), width: 1)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 35,
              //   backgroundColor: Colors.red,
              //   backgroundImage:
              //       NetworkImage(viewModel.userdata.profile.toString()),
              // ),
              profileImage(),
              const SizedBox(width: 15),
              viewModel.basicData
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 20,
                            width: 200,
                            child: editedTextField(
                                viewModel, viewModel.usernameController)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  );
}
