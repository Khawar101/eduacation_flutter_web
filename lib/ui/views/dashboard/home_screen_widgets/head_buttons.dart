import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../dashboard_viewmodel.dart';
import 'download_report.dart';

class HeadButtons extends ViewModelWidget<DashboardViewModel> {
  const HeadButtons({super.key});

  @override
  Widget build(
    BuildContext context,
    DashboardViewModel viewModel,
  ) {
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
        SizedBox(width: MediaQuery.of(context).size.width*0.5),
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

