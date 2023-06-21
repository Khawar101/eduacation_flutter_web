// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../services/Model/CoursesModel.dart';
import '../../services/courses_service.dart';
import '../views/courses/upload_courses/widgets/dropAddBtn.dart';
import '../widgets/common/icon_text_field/icon_text_field.dart';

addAssigmentAlert(
    context,
    titleCtrl,
    descriptionCtrl,
    CoursesService _coursesService,
    notifyListeners,
    List<Assigment> assigments,
    CoursesModel courseData,
    addThumbnail,
    addAssigmentFile) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title:const Center(
        child:  Text(
          'Upload Lecture',
        ),
      ),
      content: StatefulBuilder(builder: (context, newSetState) {
        return SizedBox(
          height: 290,
          child: Column(
            children: [
              IconTextField(
                titleText: "Title",
                controller: titleCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
              IconTextField(
                titleText: "Description",
                controller: descriptionCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addBtn("Thumbnail", _coursesService.progressshow,
                      _coursesService.thubnailUrl, () {
                    addThumbnail(newSetState);
                  }),
                  const SizedBox(width: 20),
                  addBtn("Assigment", _coursesService.videoProgress,
                      _coursesService.assigmentUrl, () {
                    addAssigmentFile(newSetState);
                  }),
                  // dropAddBtn(),
                ],
              )
            ],
          ),
        );
      }),
      
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(
            context,
            'Cancel',
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {

            assigments.add(Assigment(
              title: titleCtrl.text,
              description: descriptionCtrl.text,
              thumbnail: _coursesService.thubnailUrl,
              fileUrl: _coursesService.assigmentUrl,
            ));
            courseData.assigment = assigments;
            print(courseData.assigment!.length);
            notifyListeners();
            titleCtrl.clear();
            descriptionCtrl.clear();
            _coursesService.thubnailUrl = "";
            _coursesService.assigmentUrl = "";
            _coursesService.progressshow = 0;
            _coursesService.videoProgress = 0;
            Navigator.pop(context);
          },
          child: const Text(
            'Add Assigment',
          ),
        ),
      ],
    ),
  );
}
