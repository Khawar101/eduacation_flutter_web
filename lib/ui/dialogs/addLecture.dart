import 'package:flutter/material.dart';

import '../views/courses/upload_courses/widgets/dropAddBtn.dart';
import '../widgets/common/icon_text_field/icon_text_field.dart';

addLectureAlert(context, videoTitleCtrl, videoDescriptionCtrl, _coursesService,
    notifyListeners, lectures, addThumbnail, addVideo) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Upload Lecture',
      ),
      content: StatefulBuilder(builder: (context, newSetState) {
        return SizedBox(
          height: 250,
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
                      _coursesService.videoThubnailUrl, () {
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
            lectures.add({
              "title": videoTitleCtrl.text,
              "description": videoDescriptionCtrl.text,
              "thumbnale": _coursesService.videoThubnailUrl,
              "video": _coursesService.videoUrl,
            });
            notifyListeners();
            videoTitleCtrl.clear();
            videoDescriptionCtrl.clear();
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
