// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';

Widget bottomBtn(context, title, function) {
  return InkWell(
    mouseCursor: MaterialStateMouseCursor.clickable,
    onTap: function,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: const Color(0xff4873a6).withOpacity(0.7))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title == "Publish"
                ? const Icon(Icons.publish, size: 18)
                : Container(),
            title == "Draft" ? const Icon(Icons.save, size: 18) : Container(),
            title == "Previous" || title == "Cancel"
                ? const Icon(Icons.arrow_back_ios, size: 14)
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonText(text: title, color: Colors.black),
            ),
            title == "Next"
                ? const Icon(Icons.arrow_forward_ios, size: 14)
                : Container(),
          ],
        ),
      ),
    ),
  );
}
