// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_catch_error, avoid_web_libraries_in_flutter, await_only_futures
import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/services/login_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import '../app/app.locator.dart';
import 'Model/CoursesModel.dart';

class CoursesService {
  final _loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late CoursesModel courseData = CoursesModel(
      uID: _loginService.UserData.uID ?? "UaRZTAS3CYOE79s79cYeSNoANPa2",
      publisherData: PublisherData(
        name: _loginService.UserData.username ?? "Mudassir",
        email: _loginService.UserData.email ?? "xyz@gmail.com",
        profile: _loginService.UserData.profile ??
            "https://firebasestorage.googleapis.com/v0/b/education-app-b5aed.appspot.com/o/profile%2F1686228451064708?alt=media&token=7c093e32-23fd-432b-b7ba-a914cb4b5317",
      ));
  var coursesPage = 0;
  var uploadCoursesPage = 0;
  late String thubnailUrl = "";
  late String videoThubnailUrl = "";
  late String assigmentThubnailUrl = "";
  late String videoUrl = "";
  late String duration = "";
  late String assigmentUrl = "";
  var progressshow = 0;
  var videoProgress = 0;
  var assigmentProgress = 0;
  var imageLooding = false;
  late final XFile? image;
  var coursesNotifyListeners;
  cancelPage() {
    coursesPage = 0;
    coursesNotifyListeners();
  }

  uploadCoursePage(notifyListeners, page) {
    coursesPage = page;
    coursesNotifyListeners = notifyListeners;
    notifyListeners();
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

  Future uploadToStorage(title, type, notifyListeners, newSetState) async {
    // final dateTime = DateTime.now();
    uploadImage(
      onSelected: (file) {
        // final path = '${dateTime}${file.name}}';
        Reference ref = storage
            .ref()
            .child("courses/$type/${DateTime.now().microsecondsSinceEpoch}");
        UploadTask uploadTask = ref.putBlob(file);
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          imageLooding = true;
          progressshow = progress.round();
          notifyListeners();
        });
        uploadTask.whenComplete(() async {
          if (type == "Cover") {
            courseData.coverPic = await ref.getDownloadURL();
            progressshow = 0;
          } else {
            thubnailUrl = await ref.getDownloadURL();
            newSetState(() {});
          }
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
        Reference ref = storage
            .ref()
            .child("courses/$type/${DateTime.now().microsecondsSinceEpoch}");
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

          void printVideoDuration(String videoUrl) async {
            VideoPlayerController controller =
                await VideoPlayerController.network(videoUrl);
            controller = await VideoPlayerController.network(videoUrl)
              ..initialize().then((_) {
                duration = controller.value.duration
                    .toString()
                    .split('.')
                    .first
                    .padLeft(8, "0");
              });
          }

          printVideoDuration(videoUrl);

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
      ..accept = 'application/pdf';
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
        Reference ref = storage
            .ref()
            .child("courses/$type/${DateTime.now().microsecondsSinceEpoch}");
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
          // print("======>${file.type.split("/")[0]}");
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

  publishData(publish) async {
    try {
      var key = courseData.publishDate ?? DateTime.now().microsecondsSinceEpoch;
      courseData.publishDate = key.toString();
      courseData.publish = publish;
      courseData.students = 0;
      courseData.rating = 0;
      // courseData. = publish;
      // courseData.publish = publish;
      // courseData.publish = publish;

      await firestore
          .collection("courses")
          .doc(key.toString())
          .set(courseData.toJson());
      // for creating group chat
      firstSMS(key.toString());
      coursesPage = 0;
      coursesNotifyListeners();
      // message = "Login Successfully";
      log("upload successfully");
    } catch (e) {
      // message = e.toString();
      log(e.toString());
    }
  }

  Stream<List<CoursesModel>> coursesStream() {
    final stream = firestore.collection("courses").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }

  editCourseService() {}
  deleteCourseService(key) {
    firestore.collection("courses").doc(key).delete();
  }

  publishCourseService(key) {
    firestore.collection("courses").doc(key).update({"publish": true});
  }

  draftCourseService(key) {
    firestore.collection("courses").doc(key).update({"publish": false});
  }

  void firstSMS(key) async {
    Map<String, dynamic> messageData = {
      "SMS": "${_loginService.UserData.username} create group",
      "Date": "${DateTime.now().microsecondsSinceEpoch}",
      "type": "notification",
      "UID": _loginService.UserData.uID,
    };

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("chatRoom").doc(key).set({
      "Date": "${DateTime.now().microsecondsSinceEpoch}",
      "member": [
        {
          "name": _loginService.UserData.username,
          "profile": _loginService.UserData.profile,
          "UID": _loginService.UserData.uID
        },
      ],
      "membersUid": [_loginService.UserData.uID],
      "group": {
        "name": courseData.title,
        "profile": courseData.coverPic,
        "key": courseData.publishDate
      },
      "lastMessage": messageData
    });

    await firestore
        .collection("chatRoom")
        .doc(key)
        .collection('chats')
        .doc()
        .set(messageData);
  }
}
