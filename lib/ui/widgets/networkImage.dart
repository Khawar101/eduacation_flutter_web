import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget networkImage() {
  return CachedNetworkImage(
    imageUrl: "http://via.placeholder.com/200x150",
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
      ),
    ),
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
