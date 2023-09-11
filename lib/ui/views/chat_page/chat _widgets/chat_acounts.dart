import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatUsers extends ViewModelWidget<ChatPageViewModel> {
  final data;
  const ChatUsers({super.key, required this.data});

  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width < 1200
          ? MediaQuery.of(context).size.width < 500
              ? 50
              : 280
          : 350,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width < 500
                      ? 50
                      : 280
                  : 350,
              alignment: Alignment.topCenter,
              child: CustomTextField(
                hintText: "Search...",
                prefix: const Icon(Icons.search),
                controller: viewModel.searchCTRL,
              )),
          ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var _data = data[index];
              
          return ListTile(
            onTap: () {
              viewModel.setChatId(_data);
            },
            title: Text(
              _data["username"].toString(),
            ),
            subtitle:  StreamBuilder<QuerySnapshot>(
      stream: viewModel.getLastMessageStream(_data["UID"]), // Pass the user's UID
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> messageSnapshot) {
        if (messageSnapshot.hasError || messageSnapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(); // Handle loading and error states
        }

        var messages = messageSnapshot.data!.docs;
        if (messages.isNotEmpty&& messageSnapshot.hasData) {
          var lastMessage = messages.last;
             Text(
              lastMessage["SMS"].toString(),
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 11,
              ),
            );
            // trailing: Text(
            //   timeago.format(
            //     DateTime.fromMicrosecondsSinceEpoch(
            //       int.parse(lastMessage["Date"]),
            //     ),
            //   ),
            // );
            } else {
          return const SizedBox(
            child: Text("No messages"),
          );
        } return Container();
      } ,
    ),
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              backgroundImage: NetworkImage(_data["profile"].toString()),
            ),
          );
        
                 
            },
          ),

        
        ],
      ),
    );
  }
}










// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
// import '../chat_page_viewmodel.dart';
// import 'package:timeago/timeago.dart' as timeago;

// class ChatUsers extends ViewModelWidget<ChatPageViewModel> {
//   final data;
//   const ChatUsers({super.key, required this.data});
//   @override
//   Widget build(BuildContext context, ChatPageViewModel viewModel) {
//     return Container(
//       width: MediaQuery.of(context).size.width < 1200
//           ? MediaQuery.of(context).size.width < 500
//               ? 50
//               : 280
//           : 350,
//       alignment: Alignment.topCenter,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             height: 60,
//             width: MediaQuery.of(context).size.width < 1200
//                 ? MediaQuery.of(context).size.width < 500
//                     ? 50
//                     : 280
//                 : 350,
//             alignment: Alignment.topCenter,
//             child: CustomTextField(
//               hintText: "Search...",
//               prefix: const Icon(Icons.search),
//               controller: viewModel.searchCTRL,
//             ),
//           ),
//          ListView.builder(
//         itemCount: data.length,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           var _data = data[index];
//           return FutureBuilder<QuerySnapshot> (
//             future:viewModel.getLastMessageStream(_data['UID']),
//                     // Pass the user's UID
//             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> messageSnapshot) {
//               if (messageSnapshot.connectionState == ConnectionState.waiting) {
//                 return const SizedBox(); // Handle loading state
//               }
//               if (messageSnapshot.hasError) {
//                 return Text("Error loading messages: ${messageSnapshot.error}");
//               }

//               var messages = messageSnapshot.data?.docs;
//               if (messages != null && messages.isNotEmpty) {
//                 return ListTile(
//                   onTap: () {
//                     viewModel.setChatId(_data);
//                   },
//                   title: Text(
//                     _data["username"].toString(),
//                   ),
//                   subtitle: Text(
//                     messages.last["SMS"].toString(),
//                     style: const TextStyle(
//                       overflow: TextOverflow.ellipsis,
//                       fontSize: 11,
//                     ),
//                   ),
//                   trailing: Text(
//                     timeago.format(
//                       DateTime.fromMicrosecondsSinceEpoch(
//                         int.parse(messages.last["Date"]),
//                       ),
//                     ),
//                   ),
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.red,
//                     backgroundImage:
//                         NetworkImage(_data["profile"].toString()),
//                   ),
//                 );
//               }

//               // If there are no messages for this user, you can handle it here.
//               // You can return a ListTile with a message like "No messages" or any other UI element.
//               return ListTile(
//                 title: Text(
//                   _data["username"].toString(),
//                 ),
//                 subtitle: Text("No messages"),
//               );
//             },
//           );
//         },
//       ),
//         ],
//       ),
//     );
//   }
// }



