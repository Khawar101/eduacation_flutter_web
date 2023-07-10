


import 'package:education_flutter_web/ui/views/e_book/upload_ebook/upload_ebook_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ebookFaqCard(UploadebookViewModel viewModel, index, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Text(
              "Q:${viewModel.faq[index].question.toString()}",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
            ),
          ),
          IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                viewModel.removeQuestion(index);
              },
              icon: const Icon(Icons.remove_circle_outline)),
        ],
      ),
      Text(
        "Ans:${viewModel.faq[index].answer.toString()}",
        style: GoogleFonts.ibmPlexSans(
            color: const Color(0xff969799),
            fontSize: 15,
            fontWeight: FontWeight.w400),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
