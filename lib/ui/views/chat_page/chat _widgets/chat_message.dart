import 'package:flutter/material.dart';

class ChatMessage {
  String? messageContent;
  String? messageType = "send";
  ChatMessage({@required this.messageContent,  this.messageType});
}


