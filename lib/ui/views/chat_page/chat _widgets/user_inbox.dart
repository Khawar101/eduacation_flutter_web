import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';

class UserInbox extends ViewModelWidget<ChatPageViewModel> {
  const UserInbox({super.key});

  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Colors.red,
                // backgroundImage:
                //     AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "medona oster",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 11,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Active now",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 160,
          child: ListView.builder(
              itemCount: viewModel.message.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Align(
                    // alignment: Alignment.bottomRight,
                    alignment:
                        (viewModel.message[index].messageType == "recieve"
                            ? Alignment.topLeft
                            : Alignment.bottomRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.green
                        color:
                            (viewModel.message[index].messageType == "recieve"
                                ? const Color(0xFFEBF4FB)
                                : Colors.teal.shade100),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      // child: Text("data"),
                      child: Text(
                        viewModel.message[index].messageContent.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              }),
        ),
        CustomTextField(
          prefix: const Icon(Icons.emoji_emotions),
          suffix: const Icon(Icons.send),
        )
      ],
    );
  }
}
