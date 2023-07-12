// ignore_for_file: avoid_web_libraries_in_flutter, body_might_complete_normally_catch_error, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/app/app.locator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
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
  late String pdfUrl = "";
  late String duration = "";
  late String assigmentUrl = "";
  var progressshow = 0;
  var pdfProgress = 0;
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

// uploadFile(title, type, notifyListeners, newSetState) async {
//   print("==================>");
  
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     allowedExtensions: ['pdf'],
    
//     allowCompression: true,
//     allowMultiple: true,
//     withData: true,
//     withReadStream: true,
    
//   type: FileType.any,
  
// );
// }
// void uploadFile(
//     String title,
//     String type,
//     bool notifyListeners,
//     Function newSetState,
// ) {
//   print("==================>");

//   final input = html.FileUploadInputElement()
//     ..accept = 'application/pdf'; // Set accepted file types to PDF only

//   input.click();

//   input.onChange.listen((event) {
//     final files = input.files;
//     if (files != null && files.isNotEmpty) {
//       final file = files[0];
//       final reader = html.FileReader();

//       reader.onLoadEnd.listen((event) {
//         final fileContent = reader.result as String;
//         // Perform the necessary operations with the file content

//         // Notify listeners or update state if required
//         if (notifyListeners) {
//           // Call your listener function or update state using newSetState
//         }
//       });

//       reader.readAsDataUrl(file);
//     } else {
//       // User canceled the file picking operation
//     }
//   });
// }


  void loadFile({required Function(File file) onSelected}) {
    FileUploadInputElement uploadInput = FileUploadInputElement()
    ..accept = 'application/pdf'; // Set accepted file types to PDF only
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
          pdfProgress = progress.round();
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
