import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/services/Model/Chat.dart';
import 'package:education_flutter_web/services/Model/ChatMember.dart';
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

  void online(Event e) async {
    log("============>online");
    await firestore
        .collection('users')
        .doc(loginService.UserData.uID)
        .update({"status": true});
  }

  void offline(Event e) async {
    log("============>offline");
    await firestore
        .collection('users')
        .doc(loginService.UserData.uID)
        .update({"status": false});
  }

  setChatId(ChatMember chatMember) {
    // log("================>${otherData["UID"]}");
    // isOnline = otherData["status"];
    String currentuID = loginService.UserData.uID.toString();
    if (chatMember.group == null) {
      if (chatMember.member![0].uID != currentuID) {
        otherUID = chatMember.member![0].uID!.toString();
        // name = otherData["username"]??"";
        // profile = otherData["profile"]??"";
      } else {
        otherUID = chatMember.member![1].uID!.toString();
        // name = otherData["username"]??"";
        // profile = otherData["profile"]??"";
      }
      List<String> _chatID = [currentuID, otherUID]..sort();
      // log("${chatId.toString()} =====2=====${currentuID}=====>${_chatID}======>");
      chatId = _chatID.join('_');
      notifyListeners();
    } else {
      otherUID = chatMember.group!.key ?? "";
      chatId = chatMember.group!.key ?? "";
      name = chatMember.group!.name ?? "";
      profile = chatMember.group!.profile ?? "";
    }
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

  Stream<List<Chat>> chatStream() {
    final stream = firestore
        .collection("chatRoom")
        .doc(chatId)
        .collection('chats')
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return Chat.fromJson(doc.data());
        }).toList());
  }

  Stream<List<ChatMember>> chatRoomStream() {
    final stream = firestore.collection("chatRoom").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return ChatMember.fromJson(doc.data());
        }).toList());
  }

  Stream publisherStream(uID) {
    return FirebaseFirestore.instance.collection("users").doc(uID).snapshots();
  }

  void sentSMS(chatId, context, String status) async {
    // String mergeuid = uid_merge(widget.UserData['UID'], widget.UID).toString();
    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    String sms = smsController.text;
    try {
      if (sms != "") {
        Map<String, dynamic> messageData = {
          // "chatId": chatId,
          "SMS": sms,
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "type": "text",
          "UID": loginService.UserData.uID,
        };
        smsController.clear();
        if (loginService.UserData.uID == otherUID) {
          Map chatMembers = {"name": name, "profile": profile, "key": otherUID};
        }
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore.collection("chatRoom").doc(chatId).set({
          // "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "member": [
            {
              "name": loginService.UserData.username,
              "profile": loginService.UserData.profile,
              "UID": loginService.UserData.uID
            },
            {"name": name, "profile": profile, "UID": otherUID}
          ],
          "lastMessage": messageData
        });

        await firestore
            .collection("chatRoom")
            .doc(chatId)
            .collection('chats')
            .doc()
            .set(messageData);

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

  Stream<DocumentSnapshot> getLastMessageStream(otherId) {
    var currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherId]..sort();
    // log("${chatId.toString()} =====2=====${currentuID}=====>${_chatID}======>");
    String _chatId = _chatID.join('_');
    return firestore.collection('chatRoom').doc(_chatId).snapshots();
    // CollectionReference chatCollection = firestore.collection('chatRoom').doc(_chatId).snapshots();
    // if (reload < 1) {
    //   reload++;
    //   Future.delayed(const Duration(seconds: 1), () {
    //     notifyListeners();
    //   });
    // }

    // return chatCollection
    //     .where("chatId", isEqualTo: _chatId)
    //     .orderBy('Date', descending: true)
    //     .limit(1)
    //     .snapshots();
  }

  ///////////////////////

  void uploadImage({required Function(File file) onSelected}) {
    FileUploadInputElement uploadInput = FileUploadInputElement()
      // ..accept = "image/*";
      ..accept = "image/*, video/*, application/pdf";
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      }); // Pass the selected file to the callback function.
    });
  }

//

  Future uploadToStorage() async {
    // final dateTime = DateTime.now();
    uploadImage(
      onSelected: (File file) {
        Reference ref = storage
            .ref()
            .child("chatImage/${DateTime.now().microsecondsSinceEpoch}");
        UploadTask uploadTask = ref.putBlob(file);
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          imageLoading = true;
          progressshow = progress.round();
          notifyListeners();
        });
        uploadTask.whenComplete(() async {
          var imageUrl = await ref.getDownloadURL();
          log("======${imageUrl}");
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          await firestore.collection('chats').doc().set({
            "chatId": chatId,
            "SMS": imageUrl,
            "Date": "${DateTime.now().microsecondsSinceEpoch}",
            "type": file.name.split(".").last,
            "UID": loginService.UserData.uID,
          });
          notifyListeners();
          // print("=====>$url=====>${file.type.split("/")[0]}");
          // postType = "${file.type.split("/")[0]}";
          // _videoPlayerController = VideoPlayerController.network(url);
          // _isVideoPlaying = true;
          imageLoading = false;
          // _videoPlayerController.play();
        }).catchError((onError) {
          log(onError);
          // snackBar2(context, onError.toString());
        });
      },
    );
    return null;
  }
}
