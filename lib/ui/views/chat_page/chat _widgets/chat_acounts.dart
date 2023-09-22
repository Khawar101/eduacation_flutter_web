import 'dart:developer';

import 'package:education_flutter_web/services/Model/ChatMember.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatUsers extends ViewModelWidget<ChatPageViewModel> {
  final List<ChatMember> data;
  const ChatUsers({super.key, required this.data});

  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      // width: 200,
      width: MediaQuery.of(context).size.width < 1200
          ? MediaQuery.of(context).size.width < 500
              ? 50
              : 280
          : 320,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width < 500
                      ? 50
                      : 280
                  : 350,
              alignment: Alignment.topCenter,
              child: CustomTextField(
                hintText: "Search...",
                prefix: const Icon(Icons.search),
                controller: viewModel.searchCTRL,
              )),
          ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              ChatMember chatMember = data[index];
              LastMessage? lastMessage = chatMember.lastMessage;
              // log(data[index].toString());
              return ListTile(
                onTap: () {
                  log("==================>");
                  viewModel.setChatId(chatMember);
                },
                title: Text(lastMessage!.sMS ?? ""),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.11,
                      child: Text(
                        viewModel.loginService.UserData.uID == lastMessage.uID
                            ? 'Me: ${lastMessage.sMS ?? ""}'
                            : "You: ${lastMessage.sMS ?? ""}",
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Text(
                      timeago.format(
                        DateTime.fromMicrosecondsSinceEpoch(
                          int.parse(lastMessage.date ?? ""),
                        ),
                      ),
                      style: GoogleFonts.ibmPlexSans(fontSize: 12),
                    ),
                  ],
                ),
                // subtitle: StreamBuilder<DocumentSnapshot>(
                //   stream: viewModel.getLastMessageStream(
                //       _data["UID"]), // Pass the user's UID

                //   builder: (BuildContext context,
                //       AsyncSnapshot<DocumentSnapshot> messageSnapshot) {
                //     if (messageSnapshot.hasError) {
                //       log(messageSnapshot.error.toString());
                //       return Text(messageSnapshot.error
                //           .toString()); // Handle loading and error states
                //     }
                //     if (messageSnapshot.connectionState ==
                //         ConnectionState.waiting) {
                //       return const SizedBox(); // Handle loading and error states
                //     }
                //     if (!messageSnapshot.hasData) {
                //       return const SizedBox(); // Handle loading and error states
                //     }
                //     var lastMessage = messageSnapshot.data!['lastMessage'];

                //     if (messageSnapshot.hasData) {
                //       // var lastMessage = messages.last;
                //       return Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           SizedBox(
                //             width: width * 0.11,
                //             child: Text(
                //               lastMessage!["SMS"]??"No Message yet",
                //               style: const TextStyle(
                //                 overflow: TextOverflow.ellipsis,
                //                 fontSize: 11,
                //               ),
                //             ),
                //           ),
                //           Text(
                //             timeago.format(
                //               DateTime.fromMicrosecondsSinceEpoch(
                //                 int.parse(lastMessage["Date"]??""),
                //               ),
                //             ),
                //             style: GoogleFonts.ibmPlexSans(fontSize: 12),
                //           ),
                //         ],
                //       );
                //     }
                //     return const SizedBox(
                //       child: Text("No messages"),
                //     );
                //   },
                // ),

                // leading: CircleAvatar(
                //   backgroundColor: Colors.red,
                //   backgroundImage: NetworkImage(_data["profile"].toString()),
                // ),
              );
            },
          ),
        ],
      ),
    );
  }
}
