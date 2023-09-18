import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/login_service.dart';

class ChatPageViewModel extends BaseViewModel with WidgetsBindingObserver {
  //  String otherId="";
  bool isOnline = false;
  int numLines = 0;
  String chatId = "";
  String name = "";
  String profile = "";
  final loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController searchCTRL = TextEditingController();
  final TextEditingController smsController = TextEditingController();
  bool isTextEmpty = true;

  void initState() {
    smsController.addListener(updateTextStatus);
    WidgetsBinding.instance.addObserver(this);
    // setOnlineStatus("online");
    notifyListeners();
  }

  setChatId(otherData) {
    // log("sffffffff");
    name = otherData["username"];
    profile = otherData["profile"];
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
    // isTextEmpty = smsController.text.isEmpty;
    notifyListeners();
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
          // "status":status,
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

//////////////////////////////////////////off on line/////////////

//  void updateUserOnlineStatus(bool isOnline) async {
//   final userDoc = firestore.collection('users').doc(loginService.UserData.uID);

//   // Update the 'isOnline' field with the provided status and a timestamp
//   await userDoc.update({
//     'isOnline': isOnline,
//     'lastOnline': FieldValue.serverTimestamp(),
//   });
// }

  // Call this when the app starts or when the user logs in
//   void setOnlineStatus(bool online) {
//     isOnline = online;
//     updateUserOnlineStatus(online);
//     notifyListeners();
//   }

//   // Call this when the app exits or when the user logs out
//   void setOfflineStatus() {
//     setOnlineStatus(false);
//   }
//  final profileService = locator<ProfileService>();
//   // Call this to check the user's online status
//   void checkOnlineStatus() async {
//       await profileService.updateLastChatOpenTime;
//     notifyListeners();
//   }


// }

void setOnlineStatus(String status)async{
  // final userDoc = firestore.collection('chats').doc(loginService.UserData.uID);
  await  firestore.collection('users').doc(loginService.UserData.uID).update({
  "status":status
  }
);notifyListeners();}

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        log('On Resume');
        setOnlineStatus("online");
        break;
      case AppLifecycleState.inactive:
        log('On inactive');
         setOnlineStatus("offline");
        break;
      case AppLifecycleState.paused:
        log('On paused');
           setOnlineStatus("offline");
        break;
      case AppLifecycleState.detached:
        log('On detached');
           setOnlineStatus("offline");
        break;
      case AppLifecycleState.hidden:
        log('On hidden');   setOnlineStatus("offline");
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
