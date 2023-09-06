import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/chat_view3.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_page_viewmodel.dart';

class ChatPageView extends StackedView<ChatPageViewModel> {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatPageViewModel viewModel,
    Widget? child,
  ) {
    return  Container(
        // padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ChatView3(),
      
    );
  }

  @override
  ChatPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatPageViewModel();
}
