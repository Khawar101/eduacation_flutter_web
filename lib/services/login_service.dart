// ignore_for_file: non_constant_identifier_names, unused_import, avoid_web_libraries_in_flutter

import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Model/userData.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  var message = "";
  userData UserData = userData();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;



final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final UserCredential userCredential = await _auth.signInWithPopup(
        GoogleAuthProvider(),
      );
      final User user = userCredential.user!;
      print("User signed in: ${user.displayName}");
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

//   import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// Future<void> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );
//     final UserCredential authResult = await _auth.signInWithCredential(credential);
//     final User? user = authResult.user;
//     // return user;
//   } catch (error) {
//     // print('Error signing in with Google: $error');
//     return null;
//   }
// }

  // signInWithGoogle(BuildContext context) async {
  //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();
  //   final GoogleSignInAuthentication? googleSignInAuthentication =
  //       await googleSignInAccount?.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication?.idToken,
  //       accessToken: googleSignInAuthentication?.accessToken);
  //   UserCredential result = await firebaseAuth.signInWithCredential(credential);
  //   User? userDetails = result.user;
  //   if (result != null) {
  //     Map<String, dynamic> userInfoMap = {
  //       "email": userDetails!.email,
  //       "name": userDetails.displayName,
  //       // "imgUrl": userDetails.photoURL,
  //       "id": userDetails.uid,
  //     };
  //   }
  // }





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
          country: data['country'],
          city: data['city'],
          bio: data['bio'],
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
      gender: data["gender"],
      phoneNo: data["phoneNo"],
      address: data["address"],
      clas: data["clas"],
      country: data['country'],
      city: data['city'],
      bio: data['bio'],
      educationSector: data["educationSector"],
      socialLinks: data["socialLinks"],
    );
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
