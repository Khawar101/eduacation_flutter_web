// ignore_for_file: file_names

import 'package:education_flutter_web/services/Model/CoursesModel.dart';
import 'package:flutter/material.dart';
import '../../../widgets/common/reating.dart';
import '../../../widgets/common/sized_text/sized_text.dart';
import '../../../widgets/networkImage.dart';
import '../courses_viewmodel.dart';
import '../upload_courses/widgets/pop_up_menu.dart';

Widget courseCard(CoursesModel data, context, CoursesViewModel viewModel) {
  return InkWell(
    mouseCursor: MaterialStateMouseCursor.clickable,
    onTap: () {
      viewModel.showCourseDetail(data);
    },
    child: Card(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              networkImage(data.coverPic, 130, 300, false),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 8.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title.toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            reating(data.rating ?? 0, "266"),
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: CustomText(
                                  text: "\$${data.price.toString()}",
                                  size: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      data.description.toString(),
                      style: const TextStyle(
                          color: Colors.black45,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 5,
            top: 5,
            child: popupMenu(context, data, viewModel),
          )
        ],
      ),
    ),
  );
}
