import 'package:education_flutter_web/app/app.locator.dart';
import 'package:education_flutter_web/app/app.router.dart';
import 'package:education_flutter_web/services/Model/EbookModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final Map messageData;
  const MessageBubble(
      {super.key,
      required this.isMe,
      required this.message,
      required this.messageData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: Column(
            children: [
              messageData['type'] == "text"
                  ? Container(
                      constraints:
                          const BoxConstraints(minWidth: 10, maxWidth: 400),
                      child: Text(
                        message,
                        style: TextStyle(
                          height: 1.5,
                          color: isMe ? Colors.white : Colors.black,
                        ),
                        softWrap: true,
                      ),
                    )
                  : Container(),
              messageData['type'] == "image"
                  ? Image.network(message, width: 200, fit: BoxFit.cover)
                  : Container(),
              messageData['type'] == "pdf"
                  ? InkWell(
                      onTap: () {
                        _navigationService.navigateToPdfViewer(
                            pdfData: PdfFile(pdfUrl: message));
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
