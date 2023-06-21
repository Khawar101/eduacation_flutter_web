import 'dart:developer';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/Model/CoursesModel.dart';
import '../../../services/courses_service.dart';
import '../../widgets/common/sized_text/sized_text.dart';

class CoursesViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  final coursesService = locator<CoursesService>();

  var pageNo = 0;
  nextPage() {
    pageNo += 1;
    notifyListeners();
  }

  backPage() {
    pageNo -= 1;
    notifyListeners();
  }

  var coursesData = [
    {
      "title":
          "Advanced WordPress & Elementor 2023 | nable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
    {
      "title":
          "Advanced WordPress & Elementor 2023 | Build Dynamic WebsitesBuild ANY website imaginable with WordPress & Elementor using flexbox containers, custom post types & dynamic contentRating: 4.9 out of 543 reviews9.5 total hours55 lecturesIntermediateCurrent price: \$19.99",
      "rating": 4.5,
      "reated": 500,
      "price": 2323,
      "image": "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"
    },
  ];

  Widget coursesBuilder() {
    return StreamBuilder<List<CoursesModel>>(
      stream: coursesService.coursesStream(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
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
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      "https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          const PopupMenu(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        child: const Text(
                          "Descriptiodsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssn",
                          // data.title.toString(),
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
