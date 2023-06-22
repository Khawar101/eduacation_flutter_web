import 'package:flutter/material.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/courses_service.dart';
import '../../../../utils/loading.dart';
import 'coursesCard.dart';

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
          CoursesModel data = snapshot.data![index];
          return courseCard(data);
        },
      );
    },
  );
}
