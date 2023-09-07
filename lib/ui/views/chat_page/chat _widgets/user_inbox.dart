import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';
import 'chat_message.dart';

class UserInbox extends StackedView<ChatPageViewModel> {
  final String chatId;
  final String otherData;
  const UserInbox({
    Key? key,
    required this.chatId,
    required this.otherData,
  }) : super(key: key);


@override
  void onViewModelReady(ChatPageViewModel viewModel) {
    viewModel.initState();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(ChatPageViewModel viewModel) {
    viewModel.smsController.dispose();
    super.onDispose(viewModel);
  }
  @override
  Widget builder(BuildContext context, ChatPageViewModel viewModel, Widget? child) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Colors.red,
                // backgroundImage:
                //     AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "medona oster",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
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
          height: MediaQuery.of(context).size.height - 160,
          child: Expanded(
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
                    itemCount: snapshot.data?.docs
                        .length, // Replace with your actual message count
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
          //  ListView.builder(
          //     itemCount: viewModel.message.length,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          //         child: Align(
          //           // alignment: Alignment.bottomRight,
          //           alignment:
          //               (viewModel.message[index].messageType == "recieve"
          //                   ? Alignment.topLeft
          //                   : Alignment.bottomRight),
          //           child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               // color: Colors.green
          //               color:
          //                   (viewModel.message[index].messageType == "recieve"
          //                       ? const Color(0xFFEBF4FB)
          //                       : Colors.teal.shade100),
          //             ),
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 6, horizontal: 16),
          //             // child: Text("data"),
          //             child: Text(
          //               viewModel.message[index].messageContent.toString(),
          //               style: const TextStyle(fontSize: 15),
          //             ),
          //           ),
          //         ),
          //       );
          //     }),
        ),
        CustomTextField(
          prefix: const Icon(Icons.emoji_emotions),
          suffix: const Icon(Icons.send),
        )
      ],
    );
  }

    @override
  ChatPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatPageViewModel();
}
