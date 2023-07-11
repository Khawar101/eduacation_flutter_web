// ignore_for_file: avoid_web_libraries_in_flutter, body_might_complete_normally_catch_error, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/app/app.locator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'Model/EbookModel.dart';
import 'login_service.dart';

class EbookService {
  final _loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late EbookModel ebookData = EbookModel(
      uID: _loginService.UserData.uID ?? "UaRZTAS3CYOE79s79cYeSNoANPa2",
      publisherData: PublisherData(
        name: _loginService.UserData.username ?? "Mudassir",
        email: _loginService.UserData.email ?? "xyz@gmail.com",
        profile: _loginService.UserData.profile ??
            "https://firebasestorage.googleapis.com/v0/b/education-app-b5aed.appspot.com/o/profile%2F1686228451064708?alt=media&token=7c093e32-23fd-432b-b7ba-a914cb4b5317",
      ));
  var ebookPage = 0;
  var uploadEbookPage = 0;

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
  var ebookNotifyListeners;
  cancelPage() {
    ebookPage = 0;
    ebookNotifyListeners();
  }

  ebookPageNextPage(notifyListeners, page) {
    ebookPage = page;
    ebookNotifyListeners = notifyListeners;
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
            .child("E Books/$type/${DateTime.now().microsecondsSinceEpoch}");
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
            ebookData.coverPic = await ref.getDownloadURL();
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
            .child("E Books/$type/${DateTime.now().microsecondsSinceEpoch}");
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
      ..accept = "pdf/*";
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
            .child("E Books/$type/${DateTime.now().microsecondsSinceEpoch}");
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
      var key = ebookData.publishDate ?? DateTime.now().microsecondsSinceEpoch;
      ebookData.publishDate = key.toString();
      ebookData.publish = publish;
      ebookData.students = 0;
      ebookData.rating = 0;
      // courseData. = publish;
      // courseData.publish = publish;
      // courseData.publish = publish;

      await firestore
          .collection("E Books")
          .doc(key.toString())
          .set(ebookData.toJson());
      ebookPage = 0;
      ebookNotifyListeners();
      // message = "Login Successfully";
      log("upload successfully");
    } catch (e) {
      // message = e.toString();
      log(e.toString());
    }
  }

  Stream<List<EbookModel>> ebookStream() {
    final stream = firestore.collection("E Books").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return EbookModel.fromJson(doc.data());
        }).toList());
  }

  editEbookService() {}
  deleteEbookService(key) {
    firestore.collection("E Books").doc(key).delete();
  }

  publisEbookService(key) {
    firestore.collection("E Books").doc(key).update({"publish": true});
  }

  draftEbookService(key) {
    firestore.collection("E Books").doc(key).update({"publish": false});
  }
}
