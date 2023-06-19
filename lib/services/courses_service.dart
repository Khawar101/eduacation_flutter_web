// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_catch_error

import 'dart:developer';
import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CoursesService {
  var url;
  var progressshow= 0;
  var imageLooding = false;
  late final XFile? image;

  void uploadImage({required Function(File file) onSelected}) {
    FileUploadInputElement uploadInput = FileUploadInputElement()
      ..accept = "image/*, video/*";
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

  Future uploadToStorage(title, notifyListeners, newSetState) async {
    final dateTime = DateTime.now();
    uploadImage(
      onSelected: (file) {
        final path = '${dateTime}${file.name}}';
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref = storage
            .ref()
            .child("image/${DateTime.now().microsecondsSinceEpoch}");
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
          url = await ref.getDownloadURL();
          log("=====<$url");
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
    return url;
  }
}
