// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:education_flutter_web/ui/common/app_assets.dart';
import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../services/Model/CoursesModel.dart';

Widget Card_Page(context, lectureData, remove) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,

          //  height: MediaQuery.of(context).size.height * 0.22,

          //   width:MediaQuery.of(context).size.width * 0.1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  lectureData.thumbnail.toString(),
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        horizontalSpaceSmall,
        Expanded(
          flex: 2,
          //     MediaQuery.of(context).size.width*0.12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.11,
                    child: Text(
                      lectureData.title.toString(),
                      style: const TextStyle(
                          color: Color(0xff969799),
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700),
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        remove();
                      },
                      icon: const Icon(Icons.remove_circle_outline))
                ],
              ),
              verticalSpaceSmall,
              Text(
                lectureData.description.toString(),
                style: const TextStyle(
                    color: Color(0xff969799),
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400),
                maxLines: 6,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
