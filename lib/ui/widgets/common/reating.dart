import 'package:flutter/material.dart';

Widget reating(reating, reated) {
  return Row(
    children: [
      // ButtonText(
      //     text: reating.toString(), color: Color.fromARGB(255, 187, 169, 12)),
      icon(reating <= 0 ? false : true),
      icon(reating <= 1 ? false : true),
      icon(reating <= 2 ? false : true),
      icon(reating <= 3 ? false : true),
      icon(reating <= 4 ? false : true),
      Text(" ${reating.toString()} ($reated)")
    ],
  );
}

Widget icon(show) {
  return Icon(
    Icons.star,
    color: show ? Colors.yellow : Colors.grey,
    size: 15,
  );
}
