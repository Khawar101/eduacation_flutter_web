import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ratingCont(context) {
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ButtonText(
                      text: "Mudassir Mukhtar", color: Colors.black),
                  const SizedBox(height: 4),
                  RatingBar.builder(
                    initialRating: 3,
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
          SizedBox(height: 10),
          Text(
            "Last week, we dropped some major updates, giving you the power to embed custom code blocks into the site you designed and published with STUDIO AI.Cue the new Embed box from the Add panel! HTML, CSS, JavaScript - you can now inject them into your page with ease. Imagine the ability to include third party elements from surveys to Docs to your site. Its as easy as copying and pasting.",
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
