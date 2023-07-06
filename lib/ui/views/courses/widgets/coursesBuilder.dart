// ignore_for_file: file_names

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
        return Loading(100);
      }
      return GridView.builder(
        shrinkWrap: true,
       
        itemCount: snapshot.data!.length + 1,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisExtent: 260,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == snapshot.data!.length) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: viewModel.nextPage,
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 50,
                  ),
                ));
          }
          CoursesModel data = snapshot.data![index];
          return courseCard(data, context, viewModel);
        },
      );
    },
  );
}
