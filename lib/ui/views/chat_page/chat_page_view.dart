import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/chat_view3.dart';
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
        child: Row(
          children: [
            ChatUsers(),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    // color: Colors.amber,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                       CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/profile.jpg"),
                            // backgroundColor: Colors.teal.shade400,
                          ),
                          SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("medona oster", style: TextStyle(fontSize: 20),),
                            SizedBox(
                              height: 1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.green, size: 11,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Active now", style: TextStyle(fontSize: 10),)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    
                    // color: Colors.amber,
                    child: UserInbox(),
                    // child: UserInbox(),
                  ),


                  
                ],
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
