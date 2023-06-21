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
  var _formKey = GlobalKey<FormState>();

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Upload Lecture',
      ),
      content: StatefulBuilder(builder: (context, newSetState) {
        return Form(
          key: _formKey,
          child: Container(
            height: 290,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    }, context),
                    const SizedBox(width: 20),
                    addBtn("Video", _coursesService.videoProgress,
                        _coursesService.videoUrl, () {
                      addVideo(newSetState);
                    }, context),
                    // dropAddBtn(),
                  ],
                )
              ],
            ),
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
            final isValid = _formKey.currentState?.validate();
            if (isValid!) {
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
            }
            _formKey.currentState?.save();
          },
          child: const Text(
            'Add Lecture',
          ),
        ),
      ],
    ),
  );
}
