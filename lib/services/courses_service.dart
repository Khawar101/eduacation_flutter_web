// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_catch_error, avoid_web_libraries_in_flutter

import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'Model/CoursesModel.dart';

class CoursesService {
  late CoursesModel courseData = CoursesModel();
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

  PublishData() async {
    try {
      var key = DateTime.now().microsecondsSinceEpoch;
      print(courseData.toJson());
      await FirebaseFirestore.instance.collection("courses").doc(key.toString()).set(courseData.toJson());
      // message = "Login Successfully";
    } catch (e) {
      // message = e.toString();
    }
  }
}
