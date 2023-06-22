// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Model/userData.dart';

class LoginService {
  var message = "";
  userData UserData = userData();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  logins(emailCTRL, passwordCTRL) async {
    final UserCredential user;

    final String useremail = emailCTRL.text.trim();
    final String userpassword = passwordCTRL.text;
    try {
      if (useremail != '' && userpassword != '') {
        user = await auth.signInWithEmailAndPassword(
            email: useremail, password: userpassword);
        final DocumentSnapshot snapshot =
            await firestore.collection("users").doc(user.user?.uid).get();
        // storage.write(key: "UID", value: user.user?.uid);
        // final data = snapshot.data();
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        UserData = userData(
          uID: data["UID"],
          username: data["username"],
          firstName: data["firstName"],
          lastName: data["lastName"],
          email: data["email"],
          password: data["password"],
          profile: data["profile"],
          userType: data["userType"],
          gender: data["gender"],
          phoneNo: data["phoneNo"],
          address: data["address"],
          clas: data["clas"],
          educationSector: data["educationSector"],
          socialLinks: data["socialLinks"],
        );
        message = "login successfully";
        return UserData;
      } else {
        message = "Please fill all text field";
      }
    } catch (e) {
      message = e.toString();
    }
  }

  updateUserData(id) async {
    final DocumentSnapshot snapshot =
        await firestore.collection("users").doc(id).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    UserData = userData(
        uID: data["UID"],
        username: data["username"],
        firstName: data["firstName"],
        lastName: data["lastName"],
        email: data["email"],
        password: data["password"],
        profile: data["profile"],
        userType: data["userType"],
        phoneNo: data["phoneNo"],
        address: data["address"],
        clas: data["clas"]);
  }

  profileComplete() {
    var profileComplete = 0;

    if (UserData.username != null) {
      profileComplete += 10;
    }
    if (UserData.firstName != null) {
      profileComplete += 10;
    }
    if (UserData.lastName != null) {
      profileComplete += 10;
    }
    if (UserData.email != null) {
      profileComplete += 10;
    }
    if (UserData.phoneNo != null) {
      profileComplete += 10;
    }
    if (UserData.clas != null) {
      profileComplete += 10;
    }
    if (UserData.userType != null) {
      profileComplete += 10;
    }
    if (UserData.profile != null) {
      profileComplete += 10;
    }
    if (UserData.address != null) {
      profileComplete += 10;
    }
    if (UserData.socialLinks != null) {
      profileComplete += 10;
    }

    return profileComplete;
  }
}
