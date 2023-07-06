
import 'package:flutter/material.dart';

Widget coverBtn(progress, url, fun, context) {
  return InkWell(
    mouseCursor: MaterialStateMouseCursor.clickable,
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
      height: 160,
      width: MediaQuery.of(context).size.width * 0.18,
      child: url != null
          ? null
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                progress >= 3
                    ? CircularProgressIndicator(
                        value: progress / 100,
                      )
                    : const Column(
                        children: [
                          Icon(
                            Icons.add,
                            size: 30,
                          ),
                          Text("Cover Photo")
                        ],
                      ),
              ],
            ),
    ),
  );
}
