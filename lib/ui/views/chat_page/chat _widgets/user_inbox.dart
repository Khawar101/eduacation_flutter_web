import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';
import 'chat_message.dart';

class UserInbox extends ViewModelWidget<ChatPageViewModel> {
  final String chatId;
  const UserInbox({
    Key? key,
    required this.chatId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    // double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(viewModel.profile),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.name.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
      children: [
        Icon(
          Icons.circle,
          color: viewModel.isOnline
              ? Colors.green
              : Colors.grey,
          size: 11,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          viewModel.isOnline
              ? "Active now"
              : "Offline",
          style: const TextStyle(fontSize: 10),
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
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: viewModel.getMessagesStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  log(snapshot.error.toString());
                  return const Text('Error fetching messages');
                }

                if (!snapshot.hasData) {
                  return const Text('No messages yet');
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    var messageData = snapshot.data!.docs[index].data();

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MessageBubble(
                        isMe: messageData['UID'] ==
                            viewModel.loginService.UserData.uID,
                        message: messageData['SMS'],
                      ),
                    );
                  },
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xff4873a6).withOpacity(0.7),
            ),
            color: Colors.grey[200],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    // log(viewModel.checkOnlineStatus.toString());
                  },
                  icon: Icon(
                    Icons.emoji_emotions,
                    color: viewModel.isTextEmpty
                        ? Colors.grey
                        : const Color(0xff4873a6).withOpacity(0.7),
                  )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextField(
                  controller: viewModel.smsController,
                  // onChanged: (text) {
                  //   // viewModel.setNotifyListeners(); // Update the text status
                  // },
                  decoration: const InputDecoration(
                    hintText: 'Type your message...',
                    border: InputBorder.none,

                    // prefix: Icon(Icons.email, color: Colors.black,)
                  ),
                  maxLines: 5,
                  minLines: 1,
                ),
              ),
              IconButton(
                icon: Icon(Icons.send,
                    color: viewModel.smsController.text.isNotEmpty
                        ? const Color(0xff4873a6).withOpacity(0.7)
                        : Colors.grey),
                onPressed: () {
                  if (viewModel.smsController.text.isNotEmpty) {
                    viewModel.sentSMS(chatId, context,"");
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}


// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:education_flutter_web/app/app.locator.dart';
// import 'package:education_flutter_web/services/login_service.dart';
// import 'package:education_flutter_web/ui/views/chat_page/chat%20_widgets/chat_message.dart';
// import 'package:education_flutter_web/ui/views/chat_page/chat_page_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';

// class ChatRoom extends StatefulWidget {
//     final String chatId;
//   const ChatRoom({super.key, required this.chatId});

//   @override
//   State<ChatRoom> createState() => _ChatRoomState();
// }

// class _ChatRoomState extends State<ChatRoom> with WidgetsBindingObserver  {
//    final loginService = locator<LoginService>();
//  final  FirebaseFirestore firestore = FirebaseFirestore.instance;
//   @override
//     void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//       setStatus("online");setStatus("offline");
//   }
//   void setStatus(String status) async{
//      await  firestore.collection('users').doc(loginService.UserData.uID).update({
//   "status":status
//   }
// );
//   }


//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state){
//     // if(state == AppLifecycleState.resumed){
//     //  setStatus("online");
//     //  log("onlne");
//     // }else{
//     //   setStatus("offline");
//     //   log("offline");
//     // }
//      switch (state) {
//       case AppLifecycleState.resumed:
//         log('On Resume');
//         setStatus("online");
//         break;
//       case AppLifecycleState.inactive:
//         log('On inactive');
//          setStatus("offline");
//         break;
//       case AppLifecycleState.paused:
//         log('On paused');
//            setStatus("offline");
//         break;
//       case AppLifecycleState.detached:
//         log('On detached');
//            setStatus("offline");
//         break;
//       case AppLifecycleState.hidden:
//         log('On hidden');   setStatus("offline");
//         break;
//     }
//   }
//  @override
//   void dispose() {

//      WidgetsBinding.instance.removeObserver(this);
//     setStatus("offline");
//      super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  ViewModelBuilder<ChatPageViewModel>.nonReactive(
//       builder: (context, viewModel, child) =>
//        Column(
//       children: [
//         SizedBox(
//           height: 50,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(width: 20),
//               CircleAvatar(
//                 backgroundColor: Colors.red,
//                 backgroundImage: NetworkImage(viewModel.profile),
//               ),
//               const SizedBox(width: 10),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     viewModel.name.toString(),
//                     style: const TextStyle(fontSize: 20),
//                   ),
//                   const SizedBox(
//                     height: 1,
//                   ),
//                   Row(
//       children: [
//         Icon(
//           Icons.circle,
//           color: viewModel.isOnline
//               ? Colors.green
//               : Colors.grey,
//           size: 11,
//         ),
//         const SizedBox(
//           width: 8,
//         ),
//         Text(
//           viewModel.isOnline
//               ? "Active now"
//               : "Offline",
//           style: const TextStyle(fontSize: 10),
//         )
//       ],
//     ),
 

//                 ],
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height - 160,
//           child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//               stream: viewModel.getMessagesStream(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   log(snapshot.error.toString());
//                   return const Text('Error fetching messages');
//                 }

//                 if (!snapshot.hasData) {
//                   return const Text('No messages yet');
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data?.docs.length,
//                   reverse: true,
//                   itemBuilder: (context, index) {
//                     var messageData = snapshot.data!.docs[index].data();

//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: MessageBubble(
//                         isMe: messageData['UID'] ==
//                             viewModel.loginService.UserData.uID,
//                         message: messageData['SMS'],
//                       ),
//                     );
//                   },
//                 );
//               }),
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: const Color(0xff4873a6).withOpacity(0.7),
//             ),
//             color: Colors.grey[200],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     // log(viewModel.checkOnlineStatus.toString());
//                   },
//                   icon: Icon(
//                     Icons.emoji_emotions,
//                     color: viewModel.isTextEmpty
//                         ? Colors.grey
//                         : const Color(0xff4873a6).withOpacity(0.7),
//                   )),
//               const SizedBox(
//                 width: 5,
//               ),
//               Expanded(
//                 child: TextField(
//                   controller: viewModel.smsController,
//                   // onChanged: (text) {
//                   //   // viewModel.setNotifyListeners(); // Update the text status
//                   // },
//                   decoration: const InputDecoration(
//                     hintText: 'Type your message...',
//                     border: InputBorder.none,

//                     // prefix: Icon(Icons.email, color: Colors.black,)
//                   ),
//                   maxLines: 5,
//                   minLines: 1,
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.send,
//                     color: viewModel.smsController.text.isNotEmpty
//                         ? const Color(0xff4873a6).withOpacity(0.7)
//                         : Colors.grey),
//                 onPressed: () {
//                   if (viewModel.smsController.text.isNotEmpty) {
//                     viewModel.sentSMS(viewModel.chatId, context,"");
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//       viewModelBuilder: () => ChatPageViewModel(),
//     );
   
//   }
// }