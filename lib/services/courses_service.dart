// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_catch_error, avoid_web_libraries_in_flutter

import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/services/login_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../app/app.locator.dart';
import 'Model/CoursesModel.dart';

class CoursesService {
  final _loginService = locator<LoginService>();

  late CoursesModel courseData = CoursesModel(
    uID: _loginService.UserData.uID??"UaRZTAS3CYOE79s79cYeSNoANPa2",
      publisherData: PublisherData(
    name: _loginService.UserData.username??"Mudassir",
    email: _loginService.UserData.email??"xyz@gmail.com",
    profile: _loginService.UserData.profile,
  ));
  late String thubnailUrl = "";
  late String videoUrl = "";
  late String assigmentUrl = "";
  var progressshow = 0;
  var videoProgress = 0;
  var assigmentProgress = 0;
  var imageLooding = false;
  late final XFile? image;

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

  Future uploadToStorage(title, type, notifyListeners, newSetState) async {
    // final dateTime = DateTime.now();
    uploadImage(
      onSelected: (file) {
        // final path = '${dateTime}${file.name}}';
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref = storage.ref().child(
            "courses/$title/$type/${DateTime.now().microsecondsSinceEpoch}");
        UploadTask uploadTask = ref.putBlob(file);
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          imageLooding = true;
          progressshow = progress.round();
          notifyListeners();
          newSetState(() {});
        });
        uploadTask.whenComplete(() async {
          thubnailUrl = await ref.getDownloadURL();
          newSetState(() {});
          notifyListeners();
          // print("=====>$url=====>${file.type.split("/")[0]}");
          // postType = "${file.type.split("/")[0]}";
          // _videoPlayerController = VideoPlayerController.network(url);
          // _isVideoPlaying = true;
          imageLooding = false;
          // _videoPlayerController.play();
        }).catchError((onError) {
          log(onError);
          // snackBar2(context, onError.toString());
        });
      },
    );
    return thubnailUrl;
  }

  void uploadVideo({required Function(File file) onSelected}) {
    FileUploadInputElement uploadInput = FileUploadInputElement()
      ..accept = "video/*";
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

  Future uploadVideoToStorage(title, type, notifyListeners, newSetState) async {
    // final dateTime = DateTime.now();
    uploadVideo(
      onSelected: (file) {
        // final path = '${dateTime}${file.name}}';
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref = storage.ref().child(
            "courses/$title/$type/${DateTime.now().microsecondsSinceEpoch}");
        UploadTask uploadTask = ref.putBlob(file);
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          imageLooding = true;
          videoProgress = progress.round();
          notifyListeners();
          newSetState(() {});
        });
        uploadTask.whenComplete(() async {
          videoUrl = await ref.getDownloadURL();
          newSetState(() {});
          notifyListeners();
          // print("=====>$url=====>${file.type.split("/")[0]}");
          // postType = "${file.type.split("/")[0]}";
          // _videoPlayerController = VideoPlayerController.network(url);
          // _isVideoPlaying = true;
          imageLooding = false;
          // _videoPlayerController.play();
        }).catchError((onError) {
          log(onError);
          // snackBar2(context, onError.toString());
        });
      },
    );
    return videoUrl;
  }

  void loadFile({required Function(File file) onSelected}) {
    FileUploadInputElement uploadInput = FileUploadInputElement()
      ..accept = "File/*";
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

  Future uploadFile(title, type, notifyListeners, newSetState) async {
    // final dateTime = DateTime.now();
    loadFile(
      onSelected: (file) {
        // final path = '${dateTime}${file.name}}';
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref = storage.ref().child(
            "courses/$title/$type/${DateTime.now().microsecondsSinceEpoch}");
        UploadTask uploadTask = ref.putBlob(file);
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          imageLooding = true;
          videoProgress = progress.round();
          notifyListeners();
          newSetState(() {});
        });
        uploadTask.whenComplete(() async {
          assigmentUrl = await ref.getDownloadURL();
          print("======>${file.type.split("/")[0]}");
          newSetState(() {});
          notifyListeners();
          imageLooding = false;
          log(assigmentUrl);
        }).catchError((onError) {
          log(onError);
        });
      },
    );
    return assigmentUrl;
  }

  publishData() async {
    try {
      var key = DateTime.now().microsecondsSinceEpoch;
      courseData.publishDate = key.toString();
      print("${courseData.publishDate}===");
      await FirebaseFirestore.instance
          .collection("courses")
          .doc(key.toString())
          .set(courseData.toJson());
      // message = "Login Successfully";
      log("upload successfully");
    } catch (e) {
      // message = e.toString();
      log(e.toString());
    }
  }

  Stream<List<CoursesModel>> coursesStream() {
    final stream = FirebaseFirestore.instance.collection("courses").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }
}
