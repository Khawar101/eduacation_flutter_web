import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/chat_view3.dart';
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
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return  SizedBox(
      height: height*1-50,
      width: width*1,
        child: const Row(
          children: [
            ChatUsers()
          ],
        )
      
    );
  }

  @override
  ChatPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatPageViewModel();
}
