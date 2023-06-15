// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:education_flutter_web/ui/common/app_assets.dart';
import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Card_Page(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,

          //  height: MediaQuery.of(context).size.height * 0.22,

          //   width:MediaQuery.of(context).size.width * 0.1,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                lectureimage,
                height: MediaQuery.of(context).size.height * 0.24,
                fit: BoxFit.cover,
              )),
        ),
        horizontalSpaceSmall,
        Expanded(
          flex: 2,
          //     MediaQuery.of(context).size.width*0.12,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ButtonText(
                        text: "API Intedration", color: Colors.black),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle_outline))
                  ],
                ),
                verticalSpaceSmall,
                const Text(
                  "We reserve the right to require credit card or alternate non-promotional payment method information for verification purposes, even if the Gift Card or Gift Certificate fully covers the transaction order total. We do not allow the purchase of a Gift Card with another Gift Card, Gift Certificate, Savings Pass, Appreciation Award, Award Card, or Rewards Pass. One gift card per order online, please call the specific phone lines listed at www.freshgift.com.",
                  style: TextStyle(
                      color: Color(0xff969799),
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400),
                  maxLines: 6,
                ),
                verticalSpaceTiny,
              ],
            ),
          ),
        )
      ],
    ),
  );
}
