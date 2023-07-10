// ignore_for_file: non_constant_identifier_names

import 'package:education_flutter_web/services/Model/ratingModel.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_6.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/rating_cont.dart';
import 'package:education_flutter_web/utils/loading.dart';
import 'package:flutter/material.dart';

Widget View6Rating(viewModel) {
  return ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: StreamBuilder<List<RatingModel>>(
                stream: viewModel.rateingService
                    .ratingStream(viewModel.courseData.publishDate),
                builder: (BuildContext context,
                    AsyncSnapshot<List<RatingModel>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading(100);
                  }
                  if (snapshot.data!.isEmpty) {
                    return const Center(child: Text("No rating yet..."));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      // shrinkWrap: true,
                      // physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        // RatingModel data = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ratingCont(context, snapshot.data![index]),
                        );
                      });
                },
              ),
            );
}