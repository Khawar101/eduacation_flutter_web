// ignore_for_file: avoid_print

import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../services/Model/ratingModel.dart';
import '../../../../widgets/networkImage.dart';

Widget ratingCont(context, RatingModel rating) {
  return Container(
    // height: 100,
    width: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border:
          Border.all(color: const Color(0xff4873a6).withOpacity(0.7), width: 1),
    ),
    // width: MediaQuery.of(context).size.width*1,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              networkImage(rating.profile!, 20, 20, false),
              // CircleAvatar(r
              //   radius: 20,
              //   backgroundColor: Colors.black,
              //   backgroundImage: NetworkImage(rating.profile!),
              // ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonText(text: rating.name!, color: Colors.black),
                  const SizedBox(height: 4),
                  RatingBar.builder(
                    initialRating: rating.rating!,
                    itemSize: 15,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            rating.review.toString(),
            style: GoogleFonts.ibmPlexSans(
                color: Colors.black, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          )
        ],
      ),
    ),
  );
}
