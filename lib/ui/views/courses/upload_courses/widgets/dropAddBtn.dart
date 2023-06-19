// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget addBtn(type, fun) {
  return InkWell(
    onTap: fun,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      height: 90,
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            size: 30,
          ),
          Text(type)
        ],
      ),
    ),
  );
}
