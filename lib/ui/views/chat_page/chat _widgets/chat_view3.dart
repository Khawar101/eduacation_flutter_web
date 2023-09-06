
import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatView3 extends StatefulWidget {
  const ChatView3({super.key});

  @override
  State<ChatView3> createState() => _ChatView3State();
}

class _ChatView3State extends State<ChatView3> {
  List<ChatMessage> message = [
    ChatMessage(messageContent: "khawr kya hal hy", messageType: "send"),
    ChatMessage(messageContent: "Hello? Will", messageType: "send"),
    ChatMessage(messageContent: "How have you been?", messageType: "send"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude, wbu?",
        messageType: "recieve"),
    ChatMessage(messageContent: "ehh doing OK.", messageType: "send"),
    ChatMessage(
        messageContent: "is there anything wrong?", messageType: "recieve"),
    ChatMessage(messageContent: "no everything is fine ", messageType: "send"),
    ChatMessage(messageContent: "Ok", messageType: "recieve"),
    ChatMessage(
        messageContent:
            "kfsjglfhdn dfkjg flkgj;oid ifgu gduifg uifdug oih g fodiguoihu",
        messageType: "recieve"),
    ChatMessage(messageContent: "ugi igu gfiduh ifduh", messageType: "send"),
    ChatMessage(messageContent: "Ok", messageType: "recieve"),
    ChatMessage(messageContent: "Ok jhkf sgdlgj 65 65 65", messageType: "send"),
    ChatMessage(
        messageContent: "sdgosu iouh difu hifudh uhdiof uhf",
        messageType: "recieve"),
    ChatMessage(messageContent: "messageContent")
  ];
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          //////////////////contacts////////////////

          // flex: MediaQuery.of(context).size.width*3/7 >400 ? 2 :4,

          Container(
            width: MediaQuery.of(context).size.width < 1200
                ? MediaQuery.of(context).size.width < 500
                    ? 50
                    : 280
                : 350,
            alignment: Alignment.topCenter,
            color: const Color(0xFFEBF4FB),
            child: Expanded(
              child: Column(
                children: [
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 10, horizontal: 20),
                  //   height: 60,
                  //   color: const Color(0xFFEBF4FB),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //         hintText: "Search...",
                  //         prefixIcon: const Icon(Icons.search),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(
                  //             width: 1,
                  //           ),
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(
                  //             width: 1,
                  //           ),
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         fillColor: Colors.white,
                  //         filled: true),
                  //   ),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 15,
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return const ListTile(
                          title: Text("Madonna Oster"),
                          subtitle: Text(
                            "Analysis of for iegn exper ienc...",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis, fontSize: 11),
                          ),
                          trailing: Text("1:10 PM"),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/profile.jpg"),
                            // backgroundColor: Colors.teal.shade400,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          //////////////////chat////////////////////

          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: message.length,
                      // itemCount: 7,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 14, right: 14),
                          child: Align(
                            // alignment: Alignment.bottomRight,
                            alignment: (message[index].messageType == "recieve"
                                ? Alignment.topLeft
                                : Alignment.bottomRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.green
                                color: (message[index].messageType == "recieve"
                                    ? const Color(0xFFEBF4FB)
                                    : Colors.teal.shade100),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 16),
                              // child: Text("data"),
                              child: Text(
                                message[index].messageContent.toString(),
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
            ),
          ),
        ],
      ),
    );
  }
}
