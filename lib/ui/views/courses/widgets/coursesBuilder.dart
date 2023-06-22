import 'package:education_flutter_web/ui/views/courses/courses_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../utils/loading.dart';
import 'coursesCard.dart';

Widget coursesBuilder(CoursesViewModel viewModel) {
  return StreamBuilder<List<CoursesModel>>(
    stream: viewModel.coursesService.coursesStream(),
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
          return courseCard(data, context, viewModel);
        },
      );
    },
  );
}
