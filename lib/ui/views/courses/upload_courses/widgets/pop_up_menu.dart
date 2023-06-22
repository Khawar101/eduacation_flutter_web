import 'package:education_flutter_web/ui/views/courses/courses_viewmodel.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

Widget popupMenu(BuildContext context) {
  return ViewModelBuilder<CoursesViewModel>.reactive(
    builder: (context, viewModel, child) => PopupMenuButton(
      iconSize: 15,
      icon: const CircleAvatar(
          backgroundColor: Colors.white, child: Icon(Icons.more_vert)),
      position: PopupMenuPosition.over,
      onSelected: (item) {
        if (item == 0) {
          print("===>Edit");
        } else if (item == 1) {
          print("===>Publish");
        } else if (item == 2) {
          print("===>Draft");
        } else if (item == 3) {
          print("===>Delete");
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
            value: 0, child: SmallText(text: "Edit", color: Colors.black)),
        const PopupMenuItem(
            value: 1, child: SmallText(text: "Publish", color: Colors.black)),
        const PopupMenuItem(
            value: 2, child: SmallText(text: "Draft", color: Colors.black)),
        const PopupMenuItem(
            value: 3, child: SmallText(text: "Delete", color: Colors.red)),
      ],
    ),
    viewModelBuilder: () => CoursesViewModel(),
  );
}
