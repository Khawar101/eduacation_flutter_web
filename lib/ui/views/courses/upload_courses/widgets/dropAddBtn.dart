// ignore_for_file: file_names

import 'package:education_flutter_web/ui/widgets/common/video_player.dart';
import 'package:flutter/material.dart';

Widget addBtn(type, progress, url, fun) {
  return InkWell(
    onTap: fun,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: url != ""
              ? DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
              : null,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      height: 90,
      width: type == "Video" ? 190 : 90,
      child: url == ""
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
          : type == "Video"
              ? videoPlayer(url: url)
              : null,
    ),
  );
}
