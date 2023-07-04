// ignore_for_file: unrelated_type_equality_checks
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

  personalDataUpdatee(
      firstName, lastName, email, phoneNo, bio, country, city, address) async {
    var UserData = loginService.UserData;
    var uid = UserData.uID.toString();

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
          address: address,
          city: city,
          country: country,
        );
        await firestore.collection("users").doc(uid).update({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phoneNo": phoneNo,
          "bio": bio,
          "address": address,
          "city": city,
          "country": country,
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
