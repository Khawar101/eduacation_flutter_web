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
        child: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Row(
                children: [
                  ChatUsers(data: viewModel.chatMembers),
                  SizedBox(
                    width: width * 0.61,
                    child: UserInbox(
                      chatId: viewModel.chatId,
                      uID: viewModel.otherUID,
                    ),
                  )
                ],
              ));
  }

  @override
  ChatPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatPageViewModel();
}
