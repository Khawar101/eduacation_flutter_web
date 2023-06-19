// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_catch_error

import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CoursesService {
  var url;
  var progressshow;
  late final XFile? image;
  Future pickImage() async {
    image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 45);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("courses/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask = ref.putFile(File(image!.path));
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      progressshow = progress;
    });
    uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
      log(url);
      // FirebaseFirestore firestore = FirebaseFirestore.instance;
      // await firestore.collection("users").doc(widget.UserData["UID"]).update({
      //   "url": url,
      // });
      // widget.UserData["url"] = url;
    }).catchError((onError) {
      log(onError);
      // snackBar(context, onError.toString());
    });
    return url;
  }
}
