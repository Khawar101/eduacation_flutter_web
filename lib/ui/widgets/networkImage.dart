import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget networkImage(url, height, width, shape) {
  return CachedNetworkImage(
    imageUrl: url ?? "",
    height: height,
    width: width,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: shape ? BoxShape.circle : BoxShape.rectangle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
