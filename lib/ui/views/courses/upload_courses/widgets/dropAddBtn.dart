// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget addBtn(type, progress, url, fun) {
  return InkWell(
    onTap: fun,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: url != null
              ? DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
              : null,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      height: 90,
      width: 90,
      child: url == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                progress >= 3
                    ? CircularProgressIndicator(
                        value: progress / 100,
                      )
                    : Column(
                        children: [
                          const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          Text(type)
                        ],
                      ),
              ],
            )
          : null,
    ),
  );
}
