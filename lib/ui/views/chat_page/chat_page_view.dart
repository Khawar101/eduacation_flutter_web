import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/services/Model/ChatMember.dart';
import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/user_inbox.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chat _widgets/chat_acounts.dart';
import 'chat_page_viewmodel.dart';

class ChatPageView extends StackedView<ChatPageViewModel> {
  const ChatPageView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(ChatPageViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.initState();
  }

  @override
  void onDispose(ChatPageViewModel viewModel) {
    viewModel.dispose();
    super.onDispose(viewModel);
  }

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
        child: StreamBuilder<List<ChatMember>>(
            stream: viewModel.chatRoomStream(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ChatMember>> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              var data = snapshot.data!;
              return Row(
                children: [
                  SizedBox(
                      // width: MediaQuery.of(context).size.width*0.23,
                      child: ChatUsers(data: data)),
                  SizedBox(
                    width: width < 500
                        ? width * 0.25
                        : width < 700
                            ? width * 0.35
                            : width < 900
                                ? width * 0.42
                                : width < 1200
                                    ? width * 0.52
                                    : width * 0.56,
                    // width: MediaQuery.of(context).size.width < 1200
                    //     ? MediaQuery.of(context).size.width < 500
                    //         ? width*0.35
                    //         : width*0.45
                    //     : width*0.55,
                    //       width: MediaQuery.of(context).size.width*0.57,
                    child: UserInbox(
                      chatId: viewModel.chatId,
                      uID: viewModel.otherUID,
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
