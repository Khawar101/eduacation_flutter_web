import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';


import '../app/app.locator.dart';
import 'Model/CoursesModel.dart';
import 'Model/ratingModel.dart';
import 'Model/userData.dart';
import 'login_service.dart';

class RatingService {
  final _loginService = locator<LoginService>();

  String message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<RatingModel>> ratingStream(courseKey) {
    final stream = FirebaseFirestore.instance
        .collection("Rating")
        .where("courseKey", isEqualTo: courseKey)
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return RatingModel.fromJson(doc.data());
        }).toList());
  }

  rateNow(reviewCTRL, rating, CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    String review = reviewCTRL.text.trim();

    if (review == "") {
      message = "Please enter review";
    } else {
      try {
        log("======>${courseData.rating}");
        var courseKey = courseData.publishDate;
        await firestore.collection("courses").doc(courseKey).update({
          "rating": (courseData.rating ?? 5 + rating) / 2,
        });
        var key = "${_userData.uID}$courseKey";
        await firestore.collection("Rating").doc(key).set({
          "UID": _userData.uID,
          "courseKey": courseData.publishDate,
          "name": _userData.username,
          "profile": _userData.profile,
          "review": review,
          "rating": rating,
          "date": DateTime.timestamp(),
        });
        message = "Rate Successfully";
      } catch (e) {
        message = e.toString();
      }
    }
  }
}

