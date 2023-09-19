import 'dart:developer';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  
  String profile = "";
  final loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
}


