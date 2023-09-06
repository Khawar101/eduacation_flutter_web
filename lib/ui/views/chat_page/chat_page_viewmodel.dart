import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatPageViewModel extends BaseViewModel {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
   TextEditingController searchCTRL= TextEditingController();

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

     List<ChatMessage> message = [
    ChatMessage(messageContent: "khawr kya hal hy", messageType: "send"),
    ChatMessage(messageContent: "Hello? Will", messageType: "send"),
    ChatMessage(messageContent: "How have you been?", messageType: "send"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude, wbu?", messageType: "recieve"),
    ChatMessage(messageContent: "ehh doing OK.", messageType: "send"),
    ChatMessage(
        messageContent: "is there anything wrong?", messageType: "recieve"),
    ChatMessage(messageContent: "no everything is fine ", messageType: "send"),
    ChatMessage(messageContent: "Ok", messageType: "recieve"),
    ChatMessage(
        messageContent:
            "kfsjglfhdn dfkjg flkgj;oid ifgu gduifg uifdug oih g fodiguoihu",
        messageType: "recieve"),
    ChatMessage(messageContent: "ugi igu gfiduh ifduh", messageType: "send"),
    ChatMessage(messageContent: "Ok", messageType: "recieve"),
    ChatMessage(messageContent: "Ok jhkf sgdlgj 65 65 65", messageType: "send"),
    ChatMessage(
        messageContent: "sdgosu iouh difu hifudh uhdiof uhf",
        messageType: "recieve"),
    ChatMessage(messageContent: "messageContent")
  ];
}
