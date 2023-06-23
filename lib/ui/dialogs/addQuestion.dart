// ignore_for_file: file_names
import 'package:education_flutter_web/services/Model/CoursesModel.dart';
import 'package:flutter/material.dart';
import '../widgets/common/icon_text_field/icon_text_field.dart';

addQuestionAlert(context, questionCtrl, answerCtrl, List<FAQ> faq,
    CoursesModel courseData, notifyListeners) {
  var _formKey = GlobalKey<FormState>();

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'EQA question & answer',
      ),
      content: Form(
        key: _formKey,
        child: SizedBox(
          height: 180,
          width: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconTextField(
                titleText: "Question",
                controller: questionCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
              IconTextField(
                titleText: "Answer",
                controller: answerCtrl,
                hintText: 'e.g: Free Programming Courses',
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final isValid = _formKey.currentState?.validate();
            if (isValid!) {
              faq.add(
                  FAQ(question: questionCtrl.text, answer: answerCtrl.text));
              courseData.fAQ = faq;
              notifyListeners();
              questionCtrl.clear();
              answerCtrl.clear();
              Navigator.pop(context);
            }
            _formKey.currentState?.save();
          },
          child: const Text(
            'Add Question',
          ),
        ),
      ],
    ),
  );
}
