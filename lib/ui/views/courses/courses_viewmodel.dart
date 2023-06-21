import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/courses_service.dart';
import '../../widgets/common/sized_text/sized_text.dart';

class CoursesViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  final _coursesService = locator<CoursesService>();

  var pageNo = 0;
  nextPage() {
    log("=>");
    pageNo += 1;
    notifyListeners();
  }

  backPage() {
    log("<=");
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
    return StreamBuilder<QuerySnapshot>(
      stream: _coursesService.coursesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return GridView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisExtent: 260,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            var data = snapshot.data!.docs[index];
            return Card(
              child: Column(
                children: [
                  Image.network("https://img-b.udemycdn.com/course/480x270/548278_b005_9.jpg"),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          data["title"].toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                        // reating(data["rating"], data["reated"]),
                        CustomText(
                            text: "\$${data["price"]}",
                            size: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
