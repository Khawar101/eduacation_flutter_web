import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/login_service.dart';

class ChatPageViewModel extends BaseViewModel with WidgetsBindingObserver {
  //  String otherId="";
  bool isOnline = false;
  int numLines = 0;
  String chatId = "";
  String otherUID = "";
  String name = "";
   var progressshow = 0;
  var imageLoading = false;
  String profile = "";
  final loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseStorage storage = FirebaseStorage.instance;

  TextEditingController searchCTRL = TextEditingController();
  final TextEditingController smsController = TextEditingController();
  bool isTextEmpty = true;

  void initState() {
    smsController.addListener(updateTextStatus);
    if (kIsWeb) {
      window.addEventListener('focus', online);
      window.addEventListener('blur', offline);
      window.addEventListener('beforeunload', offline);
      window.addEventListener('offline', offline);
      window.addEventListener('online', online);
      window.addEventListener('pagehide', offline);
    } else {
      WidgetsBinding.instance.addObserver(this);
    }
    notifyListeners();
  }

  //////////////////////////////////////////off on line/////////////
  void dispose() {
    if (kIsWeb) {
      window.removeEventListener('focus', online);
       window.removeEventListener('blur', offline);
      window.removeEventListener('beforeunload', offline);
      window.removeEventListener('offline', offline);
      window.removeEventListener('online', online);
      window.removeEventListener('pagehide', offline);
    } else {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  void online(Event e) async{
    log("============>online");
    await  firestore.collection('users').doc(loginService.UserData.uID).update({
  "status":true
  });
  }

  void offline(Event e) async{
    log("============>offline");
    await  firestore.collection('users').doc(loginService.UserData.uID).update({
  "status":false
  });
  }

  setChatId(otherData) {
    name = otherData["username"];
    profile = otherData["profile"];
    isOnline = otherData["status"];
    otherUID = otherData["UID"];
    var currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherData['UID']]..sort();
    // log("${chatId.toString()} =====2=====${currentuID}=====>${_chatID}======>");
    chatId = _chatID.join('_');
    notifyListeners();
  }

  // void updateTextStatus(e) {
  //   numLines = '\n'.allMatches(e).length + 1;
  //   isTextEmpty = smsController.text.isEmpty;
  //   notifyListeners();
  // }

  setNotifyListeners() {
    notifyListeners();
  }

  void updateTextStatus() {
    isTextEmpty = smsController.text.isEmpty;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesStream() {
    CollectionReference chatCollection = firestore.collection('chats');

    return chatCollection
        .where("chatId", isEqualTo: chatId)
        .orderBy('Date', descending: true)
        .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;
  }

  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

      Stream publisherStream(uID) {
    return FirebaseFirestore.instance.collection("users").doc(uID).snapshots();
  }

  void sentSMS(chatId, context, String status) async {
    // String mergeuid = uid_merge(widget.UserData['UID'], widget.UID).toString();
    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    String sms = smsController.text;
    try {
      if (sms != "") {
        smsController.clear();
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore.collection('chats').doc().set({
          "chatId": chatId,
          "SMS": sms,
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "type": "text",
          "UID": loginService.UserData.uID,
        });

        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Sending....'),
        //   ),
        // );
      }
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  var reload = 0;

  Stream<QuerySnapshot> getLastMessageStream(otherId) {
    var currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherId]..sort();
    // log("${chatId.toString()} =====2=====${currentuID}=====>${_chatID}======>");
    String _chatId = _chatID.join('_');
    CollectionReference chatCollection = firestore.collection('chats');
    if (reload < 1) {
      reload++;
      Future.delayed(const Duration(seconds: 1), () {
        notifyListeners();
      });
    }

    return chatCollection
        .where("chatId", isEqualTo: _chatId)
        .orderBy('Date', descending: true)
        .limit(1)
        .snapshots();
  }

  ///////image upload in message
      
  //    void uploadImage({required Function(File file) onSelected}) {
  //   FileUploadInputElement uploadInput = FileUploadInputElement()
  //     ..accept = "image/*";
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) {
  //     final file = uploadInput.files!.first;
  //     final reader = FileReader();
  //     reader.readAsDataUrl(file);
  //     reader.onLoadEnd.listen((event) {
  //       onSelected(file);
  //     });
  //   });
  // }

  
  // Future uploadToStorage() async {
  //   // final dateTime = DateTime.now();
  //   uploadImage(
  //     onSelected: (file) {
  //       // final path = '${dateTime}${file.name}}';
  //       Reference ref = storage
  //           .ref()
  //           .child("image/${DateTime.now().microsecondsSinceEpoch}");
  //       UploadTask uploadTask = ref.putBlob(file);
  //       uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
  //         double progress =
  //             (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
  //         imageLoading = true;
  //         progressshow = progress.round();
  //         notifyListeners();
  //       });
  //       uploadTask.whenComplete(() async {
        
  //       var imageUrl = await ref.getDownloadURL();
            
  //           progressshow = 0;
          
  //         notifyListeners();
  //         // print("=====>$url=====>${file.type.split("/")[0]}");
  //         // postType = "${file.type.split("/")[0]}";
  //         // _videoPlayerController = VideoPlayerController.network(url);
  //         // _isVideoPlaying = true;
  //         imageLoading = false;
  //         return imageUrl;
  //         // _videoPlayerController.play();
  //       }).catchError((onError) {
  //         log(onError);
  //         // snackBar2(context, onError.toString());
  //       });
  //     },
  //   );
    
  // }

  void uploadImage({required Function(File file) onSelected}) {
  FileUploadInputElement uploadInput = FileUploadInputElement()
    ..accept = "image/*";
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files!.first;
    onSelected(file); // Pass the selected file to the callback function.
  });
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

Future<String?> uploadToStorage(File file) async {
  try {
    Reference ref = storage
        .ref()
        .child("image/${DateTime.now().microsecondsSinceEpoch}");

    final UploadTask uploadTask = ref.putBlob(file);
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      double progress =
          (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      imageLoading = true;
      progressshow = progress.round();
      notifyListeners();
    });

    await uploadTask.whenComplete(() async {
      var imageUrl = await ref.getDownloadURL();
      log("======${imageUrl}");
      progressshow = 0;
      imageLoading = false;
      notifyListeners();
      return imageUrl; // Return the download URL of the uploaded image.
    });

    return null; // Return null if there was no error during the upload.
  } catch (error) {
    print(error.toString());
    // Handle the error appropriately, e.g., show a snackbar or log the error.
    return error.toString(); // Return the error message if there was an error.
  }
}



}


