// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget editTextField(viewModel,cTRL) {
  return  TextField(
    controller:cTRL,
    decoration: const InputDecoration(
      hintText: 'Enter info',
      // border: UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1)),
    ),
  );
}
