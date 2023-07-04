import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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