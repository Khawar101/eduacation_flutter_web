// ignore_for_file: non_constant_identifier_names

import 'package:education_flutter_web/ui/common/app_assets.dart';
import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Card_Page(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 300,
          width: MediaQuery.of(context).size.width * 0.1,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                lectureimage,
                fit: BoxFit.cover,
              )),
        ),
        horizontalSpaceSmall,
        SizedBox(
          width: MediaQuery.of(context).size.height*0.24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ButtonText(text: "API Intedration", color: Colors.black),
              verticalSpaceSmall,
              Text(
                "We reserve the right to require credit card or alternate non-promotional payment method information for verification purposes, even if the Gift Card or Gift Certificate fully covers the transaction order total. We do not allow the purchase of a Gift Card with another Gift Card, Gift Certificate, Savings Pass, Appreciation Award, Award Card, or Rewards Pass. One gift card per order online, please call the specific phone lines listed at www.freshgift.com.",
                style: GoogleFonts.ibmPlexSans(
                    color: const Color(0xff969799),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpaceTiny,
    
            ],
          ),
        )
      ],
    ),
  );
}
