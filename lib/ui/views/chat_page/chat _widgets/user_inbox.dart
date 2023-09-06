import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';

class UserInbox extends ViewModelWidget<ChatPageViewModel> {
  const UserInbox({super.key});

  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    return  Column(
      children: [

        Container(
          height: MediaQuery.of(context).size.height-160,
          child: ListView.builder(
              itemCount:viewModel.message.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 14, right: 14),
                  child: Align(
                    // alignment: Alignment.bottomRight,
                    alignment: (viewModel.message[index].messageType == "recieve"
                        ? Alignment.topLeft
                        : Alignment.bottomRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.green
                        color: (viewModel.message[index].messageType == "recieve"
                            ? const Color(0xFFEBF4FB)
                            : Colors.teal.shade100),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      // child: Text("data"),
                      child: Text(
                      viewModel.  message[index].messageContent.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Container(
          height: 60,
          
          color: Color(0xFFEBF4FB),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),  
           color: Color(0xFFEBF4FB),
            child: TextFormField(
              
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.emoji_emotions),
              suffixIcon: Icon(Icons.send),  
                  hintText: "your message here....",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  fillColor: Colors.white,
                  filled: true),
                  
            ),
          ),
        )
      ],
    );
  }
}
