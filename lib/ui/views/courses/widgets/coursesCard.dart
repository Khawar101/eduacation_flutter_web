import 'package:education_flutter_web/services/Model/CoursesModel.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common/sized_text/sized_text.dart';
import '../courses_viewmodel.dart';
import '../upload_courses/widgets/pop_up_menu.dart';

Widget courseCard(CoursesModel data, context, CoursesViewModel viewModel) {
  return GestureDetector(
    onTap: () {
      viewModel.showCourseDetail(data);
    },
    child: Card(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                data.coverPic.toString(),
                fit: BoxFit.fitWidth,
                height: 130,
                width: 300,
              ),
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
                          maxLines: 2,
                        ),

                        // reating(data["rating"], data["reated"]),
                        CustomText(
                            text: "\$${data.price.toString()}",
                            size: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                      maxLines: 2,
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
