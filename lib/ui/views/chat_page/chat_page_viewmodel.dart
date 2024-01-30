// ignore_for_file: body_might_complete_normally_catch_error, avoid_web_libraries_in_flutter, unused_import, annotate_overrides
import 'package:education_flutter_web/services/Model/ChatMember.dart';
import 'package:education_flutter_web/services/chat_service.dart';
import 'package:education_flutter_web/services/Model/Chat.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../services/login_service.dart';
import 'package:flutter/foundation.dart';
import '../../../app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'dart:html';
import 'dart:async';
import 'dart:js';

class ChatPageViewModel extends BaseViewModel with WidgetsBindingObserver {
  //  String otherId="";
  final _chatService = locator<ChatService>();
  bool isOnline = false;
  bool isGroup = false;
  int numLines = 0;
  String chatId = "";
  String otherUID = "";
  String name = "";
  String profile = "";
  List<Member> memberList = [];
  var progressshow = 0;
  var imageLoading = false;
  final loginService = locator<LoginService>();
  String get uID => loginService.UserData.uID.toString();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<ChatMember> chatMembers = [];
  TextEditingController searchCTRL = TextEditingController();
  final TextEditingController smsController = TextEditingController();
  bool isTextEmpty = true;
  Timer? onlineTimer;

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
    // Start the online timer when the app starts
    onlineTimer =
        Timer.periodic(const Duration(minutes: 3), (_) => offline(null));
    notifyListeners();
  }

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
    // Cancel the online timer when disposing the view model
    onlineTimer?.cancel();
    super.dispose();
  }

  void online(Event e) async {
    log("============>online");
    await firestore
        .collection('users')
        .doc(loginService.UserData.uID)
        .update({"status": true});
  }

  void offline(Event? e) async {
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
      isGroup = true;
    } else {
      isGroup = false;
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
    } else {
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
    // var calculatedHeight2 = lineHeight;

    if (maxLines > 1) {
      calculatedHeight -= (maxLines + 1) * lineHeight;
    }

    return calculatedHeight;
  }

  void updateTextStatus() {
    isTextEmpty = smsController.text.isEmpty;
  }

  Stream<List<Chat>> chatStream() {
    notifyListeners();
    return _chatService.chatStream(chatId);
  }

  void _startChatRoomsStream() {
    setBusy(true);
    _chatService.getChatRoomsStream().listen((List<ChatMember> event) {
      chatMembers = event;
      setBusy(false);
      notifyListeners();
    });
  }

  Stream publisherStream(uID) {
    return _chatService.publisherStream(uID);
  }

  void sendSMS() {
    _chatService.sendSMS(chatId, name, profile, otherUID, smsController);
    notifyListeners();
  }

  void deleteMessage(chatId, id) {
    _chatService.deleteMessage(chatId, id);
    notifyListeners();
  }

  var reload = 0;

  void uploadToStorage() {
    _chatService.uploadToStorage(
        smsController, name, profile, otherUID, chatId);
    notifyListeners();
  }

  List<ChatMember> _filteredChatMembers = [];

  // Getter to access the filtered chat members
  List<ChatMember> get filteredChatMembers => _filteredChatMembers;

  // Method to filter chat members based on search text
  void filterChatMembers(String searchText) {
    if (searchText.isEmpty) {
      // If search text is empty, show all chat members
      _filteredChatMembers = chatMembers;
    } else {
      // If search text is not empty, filter chat members by name or other criteria
      _filteredChatMembers = chatMembers.where((_chatMember) {
        // Replace this condition with your filtering criteria
        if (_chatMember.group == null) {
          if (_chatMember.member![0].uID != loginService.UserData.uID) {
            return _chatMember.member![0].name!
                .toLowerCase()
                .contains(searchText.toLowerCase());
          } else {
            return _chatMember.member![1].name!
                .toLowerCase()
                .contains(searchText.toLowerCase());
          }
        } else {
          return _chatMember.group!.name!
              .toLowerCase()
              .contains(searchText.toLowerCase());
        }
      }).toList();
    }
    // Notify listeners that the filtered data has changed
    notifyListeners();
  }
}
