import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../services/Model/userData.dart';
import '../chat_page_viewmodel.dart';
import 'chat_message.dart';

class UserInbox extends ViewModelWidget<ChatPageViewModel> {
  final String chatId;
  final String uID;
  const UserInbox({Key? key, required this.chatId, required this.uID})
      : super(key: key);
  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    return uID == ""
        ? Container()
        : Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
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
                        StreamBuilder(
                          stream: viewModel.publisherStream(uID),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            }
                            userData _userData =
                                userData.fromJson(snapshot.data.data());
                            return Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: _userData.status ?? false
                                      ? Colors.green
                                      : Colors.grey,
                                  size: 11,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  _userData.status ?? false
                                      ? "Active now"
                                      : "Offline",
                                  style: const TextStyle(fontSize: 10),
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 160,
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
                        reverse: true,
                        itemBuilder: (context, index) {
                          var messageData = snapshot.data!.docs[index].data();

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MessageBubble(
                              isMe: messageData['UID'] ==
                                  viewModel.loginService.UserData.uID,
                              message: messageData['SMS'],messageData:messageData
                            ),
                          );
                        },
                      );
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                  ),
                  color: Colors.grey[200],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          // log(viewModel.checkOnlineStatus.toString());
                        },
                        icon: Icon(
                          Icons.emoji_emotions,
                          color: viewModel.isTextEmpty
                              ? Colors.grey
                              : const Color(0xff4873a6).withOpacity(0.7),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: viewModel.smsController,
                        // onChanged: (text) {
                        //   // viewModel.setNotifyListeners(); // Update the text status
                        // },
                        decoration: const InputDecoration(
                          hintText: 'Type your message...',
                          border: InputBorder.none,

                          //  suffixIcon: Icon(Icons.email, color: Colors.black,)
                        ),
                        maxLines: 5,
                        minLines: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.attachment, color: Colors.grey),
                      onPressed: () {
                         viewModel.uploadToStorage();
                     
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.send,
                          color: viewModel.smsController.text.isNotEmpty
                              ? const Color(0xff4873a6).withOpacity(0.7)
                              : Colors.grey),
                      onPressed: () {
                        if (viewModel.smsController.text.isNotEmpty) {
                          viewModel.sentSMS(chatId, context, "");
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
