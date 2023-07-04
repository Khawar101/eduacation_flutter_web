// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget editedTextField(viewModel, cTRL) {
  return TextField(
    style: GoogleFonts.ibmPlexSans(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
    controller: cTRL,
    decoration: const InputDecoration(
      hintText: 'Enter info',
      // border: UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1)),
    ),
  );
}
