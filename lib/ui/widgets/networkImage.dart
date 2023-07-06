import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget networkImage(url) {
  return CachedNetworkImage(
    imageUrl: url ?? "",
    height: 60,
    width: 60,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
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
