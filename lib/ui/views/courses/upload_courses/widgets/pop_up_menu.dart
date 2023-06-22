import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

Widget popupMenu(BuildContext context) {
  return PopupMenuButton(
    // padding: const EdgeInsets.all(0),
    iconSize: 15, position: PopupMenuPosition.over,

    // Callback that sets the selected popup menu item.
    onSelected: (item) {},
    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
      const PopupMenuItem(
          value: 0, child: SmallText(text: "Delete", color: Colors.red)),
      const PopupMenuItem(
          value: 1, child: SmallText(text: "Edit", color: Colors.black)),
      const PopupMenuItem(
          value: 2, child: SmallText(text: "Publish", color: Colors.black)),
      const PopupMenuItem(
          value: 3, child: SmallText(text: "Draft", color: Colors.black)),
    ],
  );
}
