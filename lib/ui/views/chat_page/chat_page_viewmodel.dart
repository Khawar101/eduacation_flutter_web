import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/login_service.dart';

class ChatPageViewModel extends BaseViewModel {
  //  String otherId="";
    String chatId="";
    String name="";
    String profile="";
  final loginService = locator<LoginService>();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
   TextEditingController searchCTRL= TextEditingController();
     final TextEditingController smsController = TextEditingController();
  bool isTextEmpty = true;
  void initState() {
    smsController.addListener(updateTextStatus);
    notifyListeners();
  }
  

   setChatId(otherData) {
    // log("sffffffff");
    name= otherData["username"];
    profile=otherData["profile"];
    var currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherData['UID']]..sort();
    // log("${chatId.toString()} =====2=====${currentuID}=====>${_chatID}======>");
   chatId=  _chatID.join('_');
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


     Stream<QuerySnapshot> getLastMessageStream(String chatId) {
    CollectionReference chatCollection = firestore.collection('chats');

    return chatCollection
        .where("chatId", isEqualTo: chatId)
        .orderBy('Date', descending: true)
        .limit(1)
        .snapshots() as Stream<QuerySnapshot<Map<String, dynamic>>>;
  }

  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();


}
