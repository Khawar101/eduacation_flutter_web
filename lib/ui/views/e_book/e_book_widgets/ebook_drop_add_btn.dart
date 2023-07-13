import 'package:flutter/material.dart';
import '../../../common/app_assets.dart';

Widget ebookAddBtn(type, progress, url, fun, context) {
  return InkWell(
    mouseCursor: MaterialStateMouseCursor.clickable,
    onTap: fun,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: url != ""
              ? type != "Thumbnail"
                  ? const DecorationImage(
                      image: AssetImage(done),
                      fit: BoxFit.contain,
                    )
                  : DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
              : null,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      height: 90,
      width: MediaQuery.of(context).size.width * 0.13,
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
          : null,
    ),
  );
}
