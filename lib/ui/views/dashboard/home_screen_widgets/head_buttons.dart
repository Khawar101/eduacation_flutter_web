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
        Row(
          children: [
            ElevatedButton(
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
            ),
            const SizedBox(
              width: 10,
            ),
            // ElevatedButton(
            //   style:  ButtonStyle(
            //     backgroundColor: const MaterialStatePropertyAll(Colors.white54),
            //     side: MaterialStatePropertyAll(
            //       BorderSide(
            //         style: BorderStyle.solid,
            //         width: 0.5,
            //         color: const Color(0xff4873a6).withOpacity(0.7),
            //       ),
            //     ),
            //   ),
            //   onPressed: null,
            //   child: Row(
            //     children: [
            //        Icon(
            //         Icons.cloud_download_outlined,
            //         color: const Color(0xff4873a6).withOpacity(0.7),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         "Download report",
            //         style: GoogleFonts.lato(
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 12,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
