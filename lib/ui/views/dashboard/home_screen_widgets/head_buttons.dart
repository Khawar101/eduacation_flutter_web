import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/tab_widgets/download_report.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadButtons extends StatefulWidget {
  const HeadButtons({super.key});

  @override
  State<HeadButtons> createState() => _HeadButtonsState();
}

class _HeadButtonsState extends State<HeadButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "UI MasterClass",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "1,620",
              style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ],
        ),
        const Row(
          children: [
            DownloadReport(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}
