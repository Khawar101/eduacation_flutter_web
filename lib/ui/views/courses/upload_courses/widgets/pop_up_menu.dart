import 'package:education_flutter_web/services/Model/CoursesModel.dart';
import 'package:education_flutter_web/ui/views/courses/courses_viewmodel.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

Widget popupMenu(BuildContext context, CoursesModel data,CoursesViewModel viewModel) {
  return PopupMenuButton(
      iconSize: 15,
      icon: const CircleAvatar(
          backgroundColor: Colors.white, child: Icon(Icons.more_vert)),
      position: PopupMenuPosition.over,
      onSelected: (item) {
        if (item == 0) {
         viewModel.editCourse(data);
        } else if (item == 1) {
          viewModel.publishCourse(data.publishDate);
        } else if (item == 2) {
          viewModel.draftCourse(data.publishDate);
        } else if (item == 3) {
          viewModel.deleteCourse(data.publishDate);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
            value: 0, child: SmallText(text: "Edit", color: Colors.black)),
        data.publish != true
            ? const PopupMenuItem(
                value: 1,
                child: SmallText(text: "Publish", color: Colors.black))
            : const PopupMenuItem(
                value: 2, child: SmallText(text: "Draft", color: Colors.black)),
        const PopupMenuItem(
            value: 3, child: SmallText(text: "Delete", color: Colors.red)),
      ],
    );
}
