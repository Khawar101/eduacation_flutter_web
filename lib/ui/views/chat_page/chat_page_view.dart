import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/user_inbox.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chat _widgets/chat_acounts.dart';
import 'chat_page_viewmodel.dart';

class ChatPageView extends StackedView<ChatPageViewModel> {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatPageViewModel viewModel,
    Widget? child,
  ) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 1 - 50,
        width: width * 1,
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
              return Row(
                children: [
                  ChatUsers(data: snapshot.data!.docs,),
                  SizedBox(width: MediaQuery.of(context).size.width*0.57,
                    child: Column(
                      children: [
                        UserInbox(chatId: viewModel.chatId ),
                      ],
                    ),
                  )
                ],
              );
            }));
  }

  @override
  ChatPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatPageViewModel();
}
