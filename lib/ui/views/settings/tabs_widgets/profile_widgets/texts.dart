// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:education_flutter_web/ui/views/settings/settings_viewmodel.dart';
import 'package:education_flutter_web/ui/views/settings/tabs_widgets/profile_widgets/edit_Text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      cTRL.text = answer ?? "";
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
                  child: editedTextField(viewModel, cTRL))
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