import 'package:flutter/material.dart';

import '../widgets/common/icon_text_field/icon_text_field.dart';

addQuestionAlert(context, questionCtrl, answerCtrl, faq, notifyListeners) {
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
              controller: answerCtrl,
              hintText: 'e.g: Free Programming Courses',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            faq.add({"question": questionCtrl.text, "answer": answerCtrl.text});
            notifyListeners();
            questionCtrl.clear();
            answerCtrl.clear();
            Navigator.pop(context);
          },
          child: const Text(
            'Add Question',
          ),
        ),
      ],
    ),
  );
}
