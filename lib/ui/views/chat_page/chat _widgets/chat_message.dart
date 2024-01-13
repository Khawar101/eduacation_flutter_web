import 'package:education_flutter_web/app/app.locator.dart';
import 'package:education_flutter_web/app/app.router.dart';
import 'package:education_flutter_web/services/Model/Chat.dart';
import 'package:education_flutter_web/services/Model/EbookModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final Chat messageData;
  const MessageBubble(
      {super.key, required this.isMe, required this.messageData});

  @override
  Widget build(BuildContext context) {
    return messageData.type == "notification"
        ? Align(
            alignment: Alignment.center,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  messageData.sMS ?? "",
                  style: GoogleFonts.ibmPlexSans(fontSize: 10),
                ),
              ),
            ))
        : Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isMe
                      ? const Color(0xff4873a6).withOpacity(0.7)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: isMe
                        ? const Radius.circular(10.0)
                        : const Radius.circular(0.0),
                    bottomRight: isMe
                        ? const Radius.circular(0.0)
                        : const Radius.circular(10.0),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                child: Column(
                  children: [
                    messageData.type == "text"
                        ? Container(
                            constraints: const BoxConstraints(
                                minWidth: 10, maxWidth: 400),
                            child: Text(
                              messageData.sMS ?? "",
                              style: TextStyle(
                                height: 1.5,
                                color: isMe ? Colors.white : Colors.black,
                              ),
                              softWrap: true,
                            ),
                          )
                        : Container(),
                    messageData.type == "image" ||
                            messageData.type == "jpeg" ||
                            messageData.type == "jpg" ||
                            messageData.type == "png"
                        ? Image.network(messageData.sMS ?? "",
                            width: 200, fit: BoxFit.fill)
                        : Container(),
                    messageData.type == "pdf"
                        ? InkWell(
                            onTap: () {
                              // _navigationService.navigateToPdfViewer(
                              //     pdfData:
                              //         PdfFile(pdfUrl: messageData.sMS ?? ""));
                            },
                            child: Image.asset(
                              "assets/icons/addPDF.png",
                              width: 100,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          );
  }
}
