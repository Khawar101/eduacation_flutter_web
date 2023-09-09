import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/login_service.dart';

class ChatPageViewModel extends BaseViewModel {
  //  String otherId="";
  String chatId = "";
  String name = "";
  String profile = "";
  final loginService = locator<LoginService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController searchCTRL = TextEditingController();
  final TextEditingController smsController = TextEditingController();
  bool isTextEmpty = true;
  // void initState() {
  //   smsController.addListener(updateTextStatus);
  //   notifyListeners();
  // }

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

  void updateTextStatus() {
    isTextEmpty = smsController.text.isEmpty;
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

  void sentSMS(chatId, context) async {
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
          "status": "seen",
          "type": "text",
          "UID": loginService.UserData.uID,
        });

        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Sending....'),
        //   ),
        // );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

    Stream<QuerySnapshot> getLastMessageStream(otherId) {
    var currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherId]..sort();
    log("${chatId.toString()} =====2=====${currentuID}=====>${_chatID}======>");
    String _chatId = _chatID.join('_');
    CollectionReference chatCollection = firestore.collection('chats');
   

    return chatCollection
        .where("chatId", isEqualTo: _chatId)
        .orderBy('Date', descending: true)
        .limit(1)
        .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;
  }

  // Future<String?> getLastMessageForUser(String userId) async {
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> messagesQuery =
  //         await FirebaseFirestore.instance
  //             .collection(
  //                 'messages') // Replace with your Firestore collection name
  //             .where('userId',
  //                 isEqualTo: userId) // Replace with your user ID field
  //             .orderBy('timestamp',
  //                 descending:
  //                     true) // Assuming you have a timestamp field for messages
  //             .limit(1)
  //             .get();

  //     if (messagesQuery.docs.isNotEmpty) {
  //       final lastMessage = messagesQuery.docs.first.data();
  //       if (lastMessage.containsKey('message')) {
  //         return lastMessage[
  //             'message']; // Replace 'message' with your actual message field
  //       }
  //     }
  //   } catch (e) {
  //     log('Error fetching last message: $e');
  //   }
  //   return null; // Return null if no message is found or if 'message' field doesn't exist
  // }

// Future<DateTime?> getLastMessageTimeForUser(String userId) async {
//   try {
//     final QuerySnapshot<Map<String, dynamic>> messagesQuery =
//         await FirebaseFirestore.instance
//             .collection('messages') // Replace with your Firestore collection name
//             .where('userId', isEqualTo: userId) // Replace with your user ID field
//             .orderBy('timestamp', descending: true) // Assuming you have a timestamp field for messages
//             .limit(1)
//             .get();

//     if (messagesQuery.docs.isNotEmpty) {
//       final lastMessage = messagesQuery.docs.first.data();
//       if (lastMessage.containsKey('timestamp')) {
//         final timestamp = lastMessage['timestamp']; // Replace 'timestamp' with your actual timestamp field
//         if (timestamp is Timestamp) {
//           return timestamp.toDate(); // Convert Firestore Timestamp to DateTime
//         }
//       }
//     }
//   } catch (e) {
//     print('Error fetching last message time: $e');
//   }
//   return null; // Return null if no message is found or if 'timestamp' field doesn't exist
// }
}
