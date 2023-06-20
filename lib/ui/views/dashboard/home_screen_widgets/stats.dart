import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stats extends StatefulWidget {
  final String headingText;
  final String number;
  final String containerText;
  const Stats(
      {super.key,
      required this.headingText,
      required this.containerText,
      required this.number});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            // height: 90,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                border: Border.all(width: 1,   color: const Color(0xff4873a6).withOpacity(0.7),)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text(widget.headingText, style: GoogleFonts.ibmPlexSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 12,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.number, style: GoogleFonts.ibmPlexSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                width: 1,
                                  color: const Color(0xff4873a6).withOpacity(0.7),
                               )),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              size: 12,
                            ),
                            Text(widget.containerText, style: GoogleFonts.ibmPlexSans(
                              fontWeight: FontWeight.w500
                
                            )),
                            const Text("%"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
