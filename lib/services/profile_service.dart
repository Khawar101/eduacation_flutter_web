// ignore_for_file: unrelated_type_equality_checks
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../app/app.locator.dart';
import 'Model/userData.dart';
import 'login_service.dart';

class ProfileService {
  var message = "";
  final loginService = locator<LoginService>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  basicDataUpdate(username) async {
    var UserData = loginService.UserData;
    var uid = UserData.uID.toString();
    if (username != null) {
      try {
        UserData = userData(
          username: username,
        );
        await firestore.collection("users").doc(uid).update({
          "username": username,
        });
        await loginService.updateUserData(uid);
        message = "update successfully";
      } catch (e) {
        message = e.toString();
      }
    } else {
      message = "Filed all TextField";
    }
  }

  personalDataUpdatee(firstName, lastName, email, phoneNo, bio) async {
    var UserData = loginService.UserData;
    var uid = UserData.uID.toString();
    log({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNo": phoneNo,
      "bio": bio,
    }.toString());
    if (firstName != null &&
        lastName != null &&
        email != null &&
        phoneNo != null &&
        bio != null) {
      try {
        UserData = userData(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNo: phoneNo,
          bio: bio,
        );
        await firestore.collection("users").doc(uid).update({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phoneNo": phoneNo,
          "bio": bio,
        });
        await loginService.updateUserData(uid);
        message = "update successfully";
      } catch (e) {
        message = e.toString();
      }
    } else {
      message = "Filed all TextField";
    }
  }

  regionDataUpdate(firstName, lastName, phoneNo, address, clas) async {
    // log("${UserData.email == email}, ${UserData.password == password}, ${UserData.email}, $email");
    var UserData = loginService.UserData;
    var uid = UserData.uID.toString();
    log({
      "firstName": firstName,
      "lastName": lastName,
      "phoneNo": phoneNo,
      "address": address,
      "clas": clas,
    }.toString());
    if (firstName != null &&
        phoneNo != null &&
        lastName != null &&
        address != null &&
        clas != null) {
      try {
        UserData = userData(
          firstName: firstName,
          lastName: lastName,
          phoneNo: phoneNo,
          address: address,
          clas: clas,
        );
        await firestore.collection("users").doc(uid).update({
          "firstName": firstName,
          "lastName": lastName,
          "phoneNo": phoneNo,
          "address": address,
          "clas": clas,
        });
        await loginService.updateUserData(uid);
        message = "update successfully";
      } catch (e) {
        message = e.toString();
      }
    } else {
      message = "Filed all TextField";
    }
  }
}
