import 'package:education_flutter_web/ui/widgets/common/video_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/common/icon_text_field/icon_text_field.dart';
import 'upload_view_1.dart';
import 'upload_view_2.dart';
import 'upload_view_3.dart';
import 'upload_view_4.dart';
import 'upload_view_5.dart';
import 'upload_view_6.dart';

class UploadCoursesViewModel extends BaseViewModel {
  var screenNo = 5;
  var screens = [
    const UploadView_1(),
    const UploadView_2(),
    const UploadView_3(),
    const UploadView_4(),
    const UploadView_5(),
    const UploadView_6(),
  ];
  final TextEditingController questionCtrl = TextEditingController();
  final TextEditingController answerCtrl = TextEditingController();
  backPage() {
    if (screenNo != 0) {
      screenNo -= 1;
      notifyListeners();
    }
  }

  nextPage() {
    if (screenNo != screens.length - 1) {
      screenNo += 1;
      notifyListeners();
    }
  }

  addQuestionAlert(context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'EQA question & answer',
        ),
        content: SizedBox(
          height: 150,
          child: Column(
            children: [
              IconTextField(
                titleText: "Question",
                controller: questionCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
              IconTextField(
                titleText: "Answer",
                controller: questionCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Cancel',
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Add Question',
            ),
            child: const Text(
              'OK',
            ),
          ),
        ],
      ),
    );
  }

  addLectureAlert(context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Upload Lecture',
        ),
        content: SizedBox(
          height: 250,
          child: Column(
            children: [
              IconTextField(
                titleText: "Title",
                controller: questionCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
              IconTextField(
                titleText: "Description",
                controller: questionCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
              const Card(
                child: Icon(
                  Icons.add,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Cancel',
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Add Question',
            ),
            child: const Text(
              'OK',
            ),
          ),
        ],
      ),
    );
  }

  watchvideo(context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Video',
        ),
        content: const SizedBox(
          height: 200,
          width: 300,
          child: videoPlayer(
            url:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Cancel',
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Add Question',
            ),
            child: const Text(
              'OK',
            ),
          ),
        ],
      ),
    );
  }
}
