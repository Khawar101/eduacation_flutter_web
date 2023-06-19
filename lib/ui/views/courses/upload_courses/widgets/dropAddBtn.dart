import 'package:flutter/material.dart';

Widget aleartAddBtn(type, fun) {
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
      child: Icon(
        Icons.add,
        size: 20,
      ),
    ),
  );
}
