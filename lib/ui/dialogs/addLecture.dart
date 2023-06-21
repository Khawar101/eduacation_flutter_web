import 'package:flutter/material.dart';

import '../../services/Model/CoursesModel.dart';
import '../../services/courses_service.dart';
import '../views/courses/upload_courses/widgets/dropAddBtn.dart';
import '../widgets/common/icon_text_field/icon_text_field.dart';

addLectureAlert(
    context,
    videoTitleCtrl,
    videoDescriptionCtrl,
    CoursesService _coursesService,
    notifyListeners,
    List<Lecture> lectures,
    CoursesModel courseData,
    addThumbnail,
    addVideo) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Upload Lecture',
      ),
      content: StatefulBuilder(builder: (context, newSetState) {
        return SizedBox(
        height: 290,
          child: Column(
            children: [
              IconTextField(
                titleText: "Title",
                controller: videoTitleCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
              IconTextField(
                titleText: "Description",
                controller: videoDescriptionCtrl,
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
                  addBtn("Video", _coursesService.videoProgress,
                      _coursesService.videoUrl, () {
                    addVideo(newSetState);
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
            lectures.add(Lecture(
              title: videoTitleCtrl.text,
              description: videoDescriptionCtrl.text,
              thumbnail: _coursesService.thubnailUrl,
              videoUrl: _coursesService.videoUrl,
            ));
            courseData.lecture = lectures;
            notifyListeners();
            videoTitleCtrl.clear();
            videoDescriptionCtrl.clear();
            _coursesService.thubnailUrl = "";
            _coursesService.videoUrl = "";
            _coursesService.progressshow = 0;
            _coursesService.videoProgress = 0;
            Navigator.pop(context);
          },
          child: const Text(
            'Add Lecture',
          ),
        ),
      ],
    ),
  );
}
