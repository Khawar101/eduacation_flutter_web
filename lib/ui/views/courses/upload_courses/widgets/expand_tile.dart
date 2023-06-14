import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

Widget expend_tile(title, subtitle) {
  return ExpansionTile(
    title: ButtonText(text: title, color: Colors.black),
    children: <Widget>[
      ListTile(
      
        title: BigSubText(text: subtitle),
      ),
    ],
  );
}
