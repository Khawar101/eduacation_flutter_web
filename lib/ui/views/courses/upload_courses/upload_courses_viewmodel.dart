import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/common/icon_text_field/icon_text_field.dart';
import 'upload_view_1.dart';
import 'upload_view_2.dart';
import 'upload_view_3.dart';
import 'upload_view_4.dart';
import 'upload_view_5.dart';

class UploadCoursesViewModel extends BaseViewModel {
  var screenNo = 1;
  var screens = [
    const UploadView_1(),
    const UploadView_2(),
    const UploadView_3(),
    const UploadView_4(),
    const UploadView_5(),
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
}
