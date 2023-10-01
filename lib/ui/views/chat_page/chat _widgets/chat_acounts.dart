import 'dart:developer';
import 'package:education_flutter_web/services/Model/ChatMember.dart';
import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../chat_page_viewmodel.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatUsers extends ViewModelWidget<ChatPageViewModel> {
  final List<ChatMember> data;
  const ChatUsers({super.key, required this.data});

  @override
  Widget build(BuildContext context, ChatPageViewModel viewModel) {
    final width = MediaQuery.of(context).size.width;
    final filteredData = viewModel.filteredChatMembers;
    return Container(
      width: width * 0.21,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          CustomTextField(
            hintText: "Search...",
            prefix: const Icon(Icons.search),
            controller: viewModel.searchCTRL,
            onChanged: (text) {
              viewModel.filterChatMembers(text);
            },
          ),
          verticalSpaceSmall,
          Expanded(
            child: SingleChildScrollView(
                child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                ChatMember chatMember = data[index];
                LastMessage? lastMessage = chatMember.lastMessage;
                // log(data[index].toString());
                return InkWell(
                  onTap: () {
                    log("==================>");
                    viewModel.setChatId(chatMember);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          // backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            viewModel.cruntUserProfile(chatMember) ?? "",
                          ),
                        ),
                        horizontalSpaceTiny,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.10,
                              child: Text(
                                viewModel.cruntUserName(chatMember) ?? "",
                                style: GoogleFonts.ibmPlexSans(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            verticalSpaceTiny,
                            SizedBox(
                              width: width * 0.10,
                              child: Text(
                                lastMessage!.sMS ?? "",
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: width * 0.012),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              timeago.format(
                                DateTime.fromMicrosecondsSinceEpoch(
                                  int.parse(lastMessage.date ?? ""),
                                ),
                              ),
                              style: GoogleFonts.ibmPlexSans(fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
