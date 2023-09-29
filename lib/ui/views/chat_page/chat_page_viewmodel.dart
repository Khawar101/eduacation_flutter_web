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
  bool isGroup = false;
  int numLines = 0;
  String chatId = "";
  String otherUID = "";
  String name = "";
  List<Member> memberList = [];
  var progressshow = 0;
  var imageLoading = false;
  String profile = "";
  final loginService = locator<LoginService>();
  String get uID => loginService.UserData.uID.toString();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<ChatMember> chatMembers = [];
  TextEditingController searchCTRL = TextEditingController();
  final TextEditingController smsController = TextEditingController();
  bool isTextEmpty = true;

  void initState() {
    _startChatRoomsStream();
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

  openNewChat(Member member) {
    otherUID = member.uID!.toString();
    name = member.name ?? "";
    profile = member.profile ?? "";
    String currentuID = loginService.UserData.uID.toString();
    List<String> _chatID = [currentuID, otherUID]..sort();
    chatId = _chatID.join('_');
    memberList = [];
    notifyListeners();
  }

  void setChatId(ChatMember chatMember) {
    String currentuID = loginService.UserData.uID.toString();

    if (chatMember.group == null) {
      if (chatMember.member![0].uID != currentuID) {
        openNewChat(chatMember.member![0]);
      } else {
        openNewChat(chatMember.member![1]);
      }
    } else {
      otherUID = chatMember.group!.key ?? "";
      chatId = chatMember.group!.key ?? "";
      name = chatMember.group!.name ?? "";
      profile = chatMember.group!.profile ?? "";
      memberList = chatMember.member!
          .where((member) => member.uID != currentuID)
          .toList();
    }
    notifyListeners();
  }

// This method returns current user data, excluding the logged-in user.
  Member cruntUserData(ChatMember chatMember) {
    Member _member = Member();
    String currentuID = loginService.UserData.uID.toString();

    if (chatMember.group == null) {
      if (chatMember.member![0].uID != currentuID) {
        _member.uID = chatMember.member![0].uID!.toString();
        _member.name = chatMember.member![0].name!.toString();
        _member.profile = chatMember.member![0].profile!.toString();
      } else {
        _member.uID = chatMember.member![1].uID!.toString();
        _member.name = chatMember.member![1].name!.toString();
        _member.profile = chatMember.member![1].profile!.toString();
      }
      isGroup = false;
    } else {
      isGroup = true;
      _member.uID = chatMember.group!.key ?? "";
      _member.name = chatMember.group!.name ?? "";
      _member.profile = chatMember.group!.profile ?? "";
    }

    // // If the logged-in user is in memberList, remove them
    // if (memberList.any((member) => member.uID == currentuID)) {
    //   memberList.removeWhere((member) => member.uID == currentuID);
    // }

    notifyListeners();
    return _member;
  }

  cruntUserName(chatMember) {
    Member _member = cruntUserData(chatMember);
    return _member.name;
  }

  cruntUserProfile(chatMember) {
    Member _member = cruntUserData(chatMember);
    return _member.profile;
  }

  setNotifyListeners() {
    notifyListeners();
  }

  calculateHeight(int maxLines, context) {
    const lineHeight =
        500.0; // Adjust this value based on your text style and layout
    var minHeight = maxLines == 1
        ? MediaQuery.of(context).size.height - 150
        : maxLines == 2
            ? MediaQuery.of(context).size.height - 180
            : maxLines == 1
                ? MediaQuery.of(context).size.height - 150
                : maxLines == 4
                    ? MediaQuery.of(context).size.height - 280
                    : 50; // Adjust this value as needed

    var calculatedHeight = minHeight;
    var calculatedHeight2 = lineHeight;

    if (maxLines > 1) {
      calculatedHeight -= (maxLines + 1) * lineHeight;
    }

    return calculatedHeight;
  }

  void updateTextStatus() {
    isTextEmpty = smsController.text.isEmpty;
  }

  Stream<List<Chat>> chatStream() {
    final stream = firestore
        .collection("chatRoom")
        .doc(chatId)
        .collection('chats')
        .orderBy("Date", descending: true)
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return Chat.fromJson(doc.data());
        }).toList());
  }

  // Stream<List<ChatMember>> chatRoomStream() {
  //   final stream = firestore
  //       .collection("chatRoom")
  //       // .where('membersUid', arrayContains: uID)
  //       .orderBy('lastMessage.Date', descending: true)
  //       .snapshots();
  //   return stream.map((event) => event.docs.map((doc) {
  //         return ChatMember.fromJson(doc.data());
  //       }).toList());
  // }

  Stream<List<ChatMember>> getChatRoomsStream() async* {
    setBusy(true);
    final result = firestore
        .collection('chatRoom')
        .where('membersUid', arrayContains: uID)
        // .orderBy('lastMessage.Date', descending: true)
        .snapshots();
    await for (final event in result) {
      final List<ChatMember> chatRooms = List.empty(growable: true);
      for (final doc in event.docs) {
        final data = doc.data();
        chatRooms.add(ChatMember.fromJson(data));
      }
      yield chatRooms;
    }
  }

  void _startChatRoomsStream() {
    getChatRoomsStream().listen((List<ChatMember> event) {
      chatMembers = event;
      setBusy(false);
      notifyListeners();
    });
  }

  Stream publisherStream(uID) {
    return FirebaseFirestore.instance.collection("users").doc(uID).snapshots();
  }

  void sentSMS(chatId, context) async {
    // String mergeuid = uid_merge(widget.UserData['UID'], widget.UID).toString();
    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    String sms = smsController.text;
    try {
      if (sms != "") {
        Map<String, dynamic> messageData = {
          "SMS": sms,
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "type": "text",
          "UID": loginService.UserData.uID,
        };
        smsController.clear();
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        var docRef = firestore.collection("chatRoom").doc(chatId);
        docRef.get().then((doc) => {
              if (doc.exists)
                {
                  docRef.update({"lastMessage": messageData})
                }
              else
                {
                  docRef.set({
                    "Date": "${DateTime.now().microsecondsSinceEpoch}",
                    "member": [
                      {
                        "name": loginService.UserData.username,
                        "profile": loginService.UserData.profile,
                        "UID": loginService.UserData.uID
                      },
                      {"name": name, "profile": profile, "UID": otherUID},
                    ],
                    "membersUid": [loginService.UserData.uID, otherUID],
                    "lastMessage": messageData
                  })
                }
            });
        // var data = await firestore
        //     .collection("chatRoom")
        //     .doc(chatId)
        //     .update({"lastMessage": messageData});
        await firestore
            .collection("chatRoom")
            .doc(chatId)
            .collection('chats')
            .doc()
            .set(messageData);
      }
      notifyListeners();
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  var reload = 0;

  // Stream<DocumentSnapshot> getLastMessageStream(otherId) {
  //   var currentuID = loginService.UserData.uID.toString();
  //   List<String> _chatID = [currentuID, otherId]..sort();
  //   // log("${chatId.toString()} =====2=====${currentuID}=====>${_chatID}======>");
  //   String _chatId = _chatID.join('_');
  //   if (reload < 1) {
  //     reload++;
  //     Future.delayed(const Duration(seconds: 1), () {
  //       notifyListeners();
  //     });
  //   }
  //   return firestore.collection('chatRoom').doc(_chatId).snapshots();
  //   // CollectionReference chatCollection = firestore.collection('chatRoom').doc(_chatId).snapshots();

  //   // return chatCollection
  //   //     .where("chatId", isEqualTo: _chatId)
  //   //     .orderBy('Date', descending: true)
  //   //     .limit(1)
  //   //     .snapshots();
  // }

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
          Map<String, dynamic> messageData = {
            "SMS": imageUrl,
            "Date": "${DateTime.now().microsecondsSinceEpoch}",
            "type": file.name.split(".").last,
            "UID": loginService.UserData.uID,
          };
          smsController.clear();
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          var docRef = firestore.collection("chatRoom").doc(chatId);
          docRef.get().then((doc) => {
                if (doc.exists)
                  {
                    docRef.update({"lastMessage": messageData})
                  }
                else
                  {
                    docRef.set({
                      "Date": "${DateTime.now().microsecondsSinceEpoch}",
                      "member": [
                        {
                          "name": loginService.UserData.username,
                          "profile": loginService.UserData.profile,
                          "UID": loginService.UserData.uID
                        },
                        {"name": name, "profile": profile, "UID": otherUID},
                      ],
                      "membersUid": [loginService.UserData.uID, otherUID],
                      "lastMessage": messageData
                    })
                  }
              });
          // var data = await firestore
          //     .collection("chatRoom")
          //     .doc(chatId)
          //     .update({"lastMessage": messageData});
          await firestore
              .collection("chatRoom")
              .doc(chatId)
              .collection('chats')
              .doc()
              .set(messageData);

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

  // List<ChatMember> _filteredChatMembers = [];

  // // Getter to access the filtered chat members
  // List<ChatMember> get filteredChatMembers => _filteredChatMembers;

  // // Method to filter chat members based on search text
  // void filterChatMembers(String searchText) {
  //   if (searchText.isEmpty) {
  //     // If search text is empty, show all chat members
  //     _filteredChatMembers = data;
  //   } else {
  //     // If search text is not empty, filter chat members by name or other criteria
  //     _filteredChatMembers = data.where((chatMember) {
  //       // Replace this condition with your filtering criteria
  //       return chatMember.name.toLowerCase().contains(searchText.toLowerCase());
  //     }).toList();
  //   }
  //   // Notify listeners that the filtered data has changed
  //   notifyListeners();
  // }
}
