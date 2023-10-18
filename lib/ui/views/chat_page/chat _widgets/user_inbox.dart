import 'dart:developer';
import 'package:education_flutter_web/services/Model/Chat.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../services/Model/userData.dart';
import '../../../widgets/common/sized_text/sized_text.dart';
import '../chat_page_viewmodel.dart';
import 'chat_message.dart';

class UserInbox extends ViewModelWidget<ChatPageViewModel> {
  final String chatId;
  final String uID;

  const UserInbox({Key? key, required this.chatId, required this.uID})
      : super(key: key);
  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    final width = MediaQuery.of(context).size.width;
    int maxLines = 1;
    return uID == ""
        ? const Center(child: Text("No Message"))
        : Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    CircleAvatar(
                      // radius: 20,
                      backgroundColor: Colors.green.withOpacity(0.7),
                      backgroundImage: NetworkImage(viewModel.profile),
                      child: viewModel.profile == ""
                          ? CustomText(
                              text: viewModel.name.isNotEmpty
                                  ? viewModel.name[0].toUpperCase()
                                  : "", // Display the first letter of the name
                              size: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )
                          : Container(),
                    ),
                    // CircleAvatar(
                    //   backgroundColor: Colors.red,
                    //   backgroundImage: NetworkImage(viewModel.profile),
                    // ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.name.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 1),
                        !viewModel.isGroup
                            ? Expanded(
                                child: viewModel.memberList.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: viewModel.memberList.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (ctx, index) {
                                          return InkWell(
                                            onTap: () {
                                              viewModel.openNewChat(
                                                  viewModel.memberList[index]);
                                            },
                                            child: Text(
                                                "${viewModel.memberList[index].name}, "),
                                          );
                                        },
                                      )
                                    : const Text(
                                        "No One Member In This Group Right Know"),
                              )
                            : StreamBuilder(
                                stream: viewModel.publisherStream(uID),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
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
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: viewModel.calculateHeight(maxLines, context),
                child: StreamBuilder<List<Chat>>(
                    stream: viewModel.chatStream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Chat>> snapshot) {
                      if (snapshot.hasError) {
                        log(snapshot.error.toString());
                        return Text(snapshot.error.toString());
                      }

                      if (!snapshot.hasData) {
                        return const Text('No messages yet...');
                      }

                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final Chat messageData = snapshot.data![index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onDoubleTap: (){
                                   viewModel.deleteMessage(chatId, messageData.id);
                            // log(messageData.id.toString());
                              },
                              child: MessageBubble(
                                  isMe: messageData.uID ==
                                      viewModel.loginService.UserData.uID,
                                  messageData: messageData),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Container(
                width: width,
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
                          minLines: 1),
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
                          viewModel.sendSMS();
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
