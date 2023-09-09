import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatUsers extends ViewModelWidget<ChatPageViewModel> {
  final data;
  const ChatUsers({super.key, required this.data});

  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width < 1200
          ? MediaQuery.of(context).size.width < 500
              ? 50
              : 280
          : 350,
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
              var _data = data[index];
              return StreamBuilder<QuerySnapshot>(
                stream: viewModel
                    .getLastMessageStream(_data["UID"]), // Pass the user's UID
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> messageSnapshot) {
                  if (messageSnapshot.hasError ||
                      messageSnapshot.connectionState ==
                          ConnectionState.waiting) {
                    return const SizedBox(); // Handle loading and error states
                  }

                  var messages = messageSnapshot.data!.docs;
                  if (messages.isNotEmpty) {
                    var lastMessage = messages.last;
                    return ListTile(
                      onTap: () {
                        viewModel.setChatId(_data);
                      },
                      title: Text(
                        _data["username"].toString(),
                      ),
                      subtitle: Text(
                        lastMessage["SMS"].toString(),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 11,
                        ),
                      ),
                      trailing: Text(""
                          // timeago.format(
                          //   DateTime.fromMicrosecondsSinceEpoch(
                          //     int.parse(lastMessage["Date"]),
                          //   ),
                          // ),
                          ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage:
                            NetworkImage(_data["profile"].toString()),
                      ),
                    );
                  } else {
                    return const SizedBox(
                      child: Text("No messages"),
                    );
                  }
                },
              );
            },
          ),

          // ListView.builder(
          //   itemCount: data.length,
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) {
          //     var _data = data[index];

          //     return ListTile(
          //       onTap: () {
          //         viewModel.setChatId(_data);
          //       },
          //       title: Text(
          //         _data["username"].toString(),
          //       ),
          //       subtitle: const Text(
          //         "Analysis of for iegn exper ienc...",
          //         style:
          //             TextStyle(overflow: TextOverflow.ellipsis, fontSize: 11),
          //       ),
          //       trailing: const Text("1:30PM"),
          //       leading: CircleAvatar(
          //         backgroundColor: Colors.red,
          //         backgroundImage: NetworkImage(_data["profile"].toString()),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}


// ListView.builder(
        //   itemCount: data.length,
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     var _data = data[index];
        //     //  var lastMessage = viewModel. getLastMessageForUser(_data["userId"]);
        //     // String lastMessage1 = _data.lastMessage ?? "No messages";
        //     // DateTime lastMessageTime = _data.lastMessageTime ?? DateTime.now();
        //     return StreamBuilder<QuerySnapshot>(
        //       stream: viewModel.getLastMessageStream(),
        //       builder: (BuildContext context,
        //           AsyncSnapshot<QuerySnapshot> messageSnapshot) {
        //         if (messageSnapshot.hasError ||
        //             messageSnapshot.connectionState ==
        //                 ConnectionState.waiting) {
        //           return const SizedBox();
        //         }
        //         var messages = messageSnapshot.data!.docs;
        //         if (messages.isNotEmpty) {
        //           var lastMessage = messages.last;
        //           return ListTile(
        //             onTap: () {
        //               viewModel.setChatId(_data);
        //             },
        //             title: Text(
        //               _data["username"].toString(),
        //             ),
        //             subtitle: Text(
        //               lastMessage["SMS"].toString(),

        //               // "Analysis of for iegn exper ienc...",
        //               style: const TextStyle(
        //                   overflow: TextOverflow.ellipsis, fontSize: 11),
        //             ),
        //             trailing: Text(
        //               timeago.format(DateTime.fromMicrosecondsSinceEpoch(
        //                       int.parse(lastMessage["Date"]))
        //                   // "1:30PM"
        //                   ),
        //             ),
        //             leading: CircleAvatar(
        //               backgroundColor: Colors.red,
        //               backgroundImage:
        //                   NetworkImage(_data["profile"].toString()),
        //             ),
        //           );
        //         } else {
        //           return const SizedBox(
        //             child: Text("dsssssss======ssssssssssssssss"),
        //           );
        //         }
        //       },
        //     );
        //   },
        // ),