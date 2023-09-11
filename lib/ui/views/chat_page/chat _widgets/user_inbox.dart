import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';
import 'chat_message.dart';

class UserInbox extends ViewModelWidget<ChatPageViewModel> {
  final String chatId;
  const UserInbox({
    Key? key,
    required this.chatId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(viewModel.profile),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.name.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 11,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Active now",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: viewModel.getMessagesStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  log(snapshot.error.toString());
                  return const Text('Error fetching messages');
                }

                if (!snapshot.hasData) {
                  return const Text('No messages yet');
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  // Replace with your actual message count
                  reverse: true, // To show the latest messages at the bottom
                  itemBuilder: (context, index) {
                    var messageData = snapshot.data!.docs[index].data();

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MessageBubble(
                        isMe: messageData['UID'] ==
                            viewModel.loginService.UserData.uID,
                        message: messageData['SMS'],
                      ),
                    );
                  },
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xff4873a6).withOpacity(0.7),
            ),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: viewModel.smsController,
                  onChanged: (text) {
                  
                    // viewModel.updateTextStatus(); // Update the text status
                  },
                  decoration: const InputDecoration(
                    hintText: 'Type your message...',
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                  minLines: 1,
                ),
              ),
              IconButton(
                icon: Icon(Icons.send,
                    color: viewModel.smsController.text == ""
                        ?Colors.grey
                        : const Color(0xff4873a6).withOpacity(0.7) ),
                onPressed: () {
                  if (viewModel.smsController.text != "") {
                    viewModel.sentSMS(chatId, context);
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
