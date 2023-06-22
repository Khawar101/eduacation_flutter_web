import 'package:flutter/material.dart';

snakBar(context, title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(title),
    dismissDirection: DismissDirection.endToStart,
  ));
}
