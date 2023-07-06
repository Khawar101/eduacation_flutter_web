// ignore_for_file: unrelated_type_equality_checks, body_might_complete_normally_catch_error
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

  Future uploadToStorage(notifyListeners) async {
    var UserData = loginService.UserData;
    var uid = UserData.uID.toString();
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
