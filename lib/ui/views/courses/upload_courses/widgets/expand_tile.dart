import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

import '../upload_courses_viewmodel.dart';

Widget expend_tile(UploadCoursesViewModel viewModel, index) {
  return Card(
    child: ExpansionTile(
      title: ButtonText(
          text: viewModel.faq[index].question.toString(), color: Colors.black),
      trailing: IconButton(
          onPressed: () {
            viewModel.removeQuestion(index);
          },
          icon: const Icon(Icons.remove_circle_outline)),
      children: <Widget>[
        Row(
          children: [
            const SizedBox(width: 100),
            BigSubText(text: viewModel.faq[index].answer.toString()),
          ],
        ),
      ],
    ),
  );
}
