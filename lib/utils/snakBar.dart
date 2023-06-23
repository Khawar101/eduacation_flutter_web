// ignore_for_file: file_names
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/resources/arrays.dart';

snakBar(context, title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(title),
    dismissDirection: DismissDirection.endToStart,
  ));
}

void displayWarningMotionToast(context) {
  MotionToast.warning(
    animationType: AnimationType.fromLeft,
    title: const Text(
      'Warning Motion Toast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: const Text('This is a Warning'),
    animationCurve: Curves.bounceIn,
    borderRadius: 0,
    animationDuration: const Duration(milliseconds: 1000),
  ).show(context);
}
