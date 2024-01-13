// ignore_for_file: unrelated_type_equality_checks, body_might_complete_normally_catch_error, non_constant_identifier_names, avoid_web_libraries_in_flutter
import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../app/app.locator.dart';
import 'Model/userData.dart';
import 'login_service.dart';

class ProfileService {
  var message = "";
  var profile = "";
  var progressshow = 0;
  final loginService = locator<LoginService>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

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

  void uploadImage({required Function(File file) onSelected}) {
    FileUploadInputElement uploadInput = FileUploadInputElement()
      ..accept = "image/*";
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
  }

  Future uploadProfile(notifyListeners) async {
    var _userData = loginService.UserData;
    var uid = _userData.uID.toString();
    uploadImage(
      onSelected: (file) {
        // final path = '${dateTime}${file.name}}';
        Reference ref = storage.ref().child(uid);
        UploadTask uploadTask = ref.putBlob(file);
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          progressshow = progress.round();
          notifyListeners();
        });
        uploadTask.whenComplete(() async {
          profile = await ref.getDownloadURL();
          progressshow = 0;
          notifyListeners();
          await firestore.collection("users").doc(uid).update({
            "profile": profile,
          });
          await loginService.updateUserData(uid);
          // print("=====>$url=====>${file.type.split("/")[0]}");
          // postType = "${file.type.split("/")[0]}";
          // _videoPlayerController = VideoPlayerController.network(url);
          // _isVideoPlaying = true;
          // _videoPlayerController.play();
        }).catchError((onError) {
          log(onError);
          // snackBar2(context, onError.toString());
        });
      },
    );
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
          country: country,
          city: city,
          address: address,
        );
        await firestore.collection("users").doc(uid).update({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phoneNo": phoneNo,
          "bio": bio,
          "country": country,
          "city": city,
          "address": address,
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

//////////////online offline chat user function////////////////
  Future<bool> getUserOnlineStatus() async {
    firestore.collection('users').doc(loginService.UserData.uID).update({
      "date": DateTime,
    });
    log("====>getUserOnlineStatus");

    final userSnapshot = await firestore
        .collection('users')
        .doc(loginService.UserData.uID)
        .get();
    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      log("====> userSnapshot.data() as Map<String, dynamic>;");
      // Get the 'isOnline' status from the user's data
      final isOnline =
          userData['isOnline'] ?? false; // Default to false if not available
      log("=====> userData['isOnline'] ?? false;");
      return isOnline;
    }
    log("==========================");

    // Default to offline if no data is available
    return false;
  }

  Future<void> updateLastChatOpenTime() async {
    final userDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(loginService.UserData.uID);

    await userDocRef.update({
      "lastChatOpenTime": FieldValue
          .serverTimestamp(), // Use FieldValue.serverTimestamp() to get the server's timestamp.
    });
  }
}
