import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadReport extends StatelessWidget {
  const DownloadReport({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.white54),
        side: MaterialStatePropertyAll(
          BorderSide(
            style: BorderStyle.solid,
            width: 0.5,
            color: const Color(0xff4873a6).withOpacity(0.7),
          ),
        ),
      ),
      onPressed: null,
      child: Row(
        children: [
          Icon(
            Icons.cloud_download_outlined,
            color: const Color(0xff4873a6).withOpacity(0.7),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Download report",
            style: GoogleFonts.lato(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
