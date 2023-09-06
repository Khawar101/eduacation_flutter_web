import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';

class ChatUsers extends ViewModelWidget<ChatPageViewModel> {
  const ChatUsers({super.key});

  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width < 1200
          ? MediaQuery.of(context).size.width < 500
              ? 50
              : 280
          : 350,
      alignment: Alignment.topCenter,
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
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: viewModel.usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                
                itemBuilder: (context, index) {
                 var data= snapshot.data!.docs[index];
                  return 
                   ListTile(
                    title: Text(data["username"]
                                                          .toString(),),
                    subtitle: Text(
                      "Analysis of for iegn exper ienc...",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, fontSize: 11),
                    ),
                    trailing: Text("1:10 PM"),
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                       backgroundImage:NetworkImage(
                                                  data["profile"].toString()),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
