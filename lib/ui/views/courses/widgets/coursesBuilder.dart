import 'package:flutter/material.dart';

import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/courses_service.dart';
import '../../../../utils/loading.dart';
import '../../../widgets/common/sized_text/sized_text.dart';
import '../upload_courses/widgets/pop_up_menu.dart';

Widget coursesBuilder(CoursesService coursesService) {
  return StreamBuilder<List<CoursesModel>>(
    stream: coursesService.coursesStream(),
    builder:
        (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Loading();
      }
      return GridView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data!.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisExtent: 260,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          var data = snapshot.data![index];
          return GestureDetector(
            child: Card(
              child: Column(
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
                      Stack(
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
                          const Positioned(
                            right: 5,
                            top: 5,
                            child: PopupMenu(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
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
            ),
          );
        },
      );
    },
  );
}
