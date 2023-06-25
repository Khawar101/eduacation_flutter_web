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

void warningToast(context, title) {
  MotionToast.warning(
    animationType: AnimationType.fromBottom,
    position: MotionToastPosition.bottom,
    animationDuration: const Duration(milliseconds: 1000),
    toastDuration: const Duration(seconds: 3),
    animationCurve: Curves.ease,
    title: const Text(
      'Warning',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(title),
    borderRadius: 10,
  ).show(context);
}

void successToast(context,title) {
  MotionToast.success(
    animationType: AnimationType.fromBottom,
    position: MotionToastPosition.bottom,
    animationDuration: const Duration(milliseconds: 1000),
    toastDuration: const Duration(seconds: 3),
    animationCurve: Curves.ease,
    width: 350,
    height: 80,
    title: const Text(
      'Success',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description:  Text(title),
    borderRadius: 10,
  ).show(context);
}

void infoToast(context,title) {
  MotionToast.info(
    animationType: AnimationType.fromBottom,
    position: MotionToastPosition.bottom,
    animationDuration: const Duration(milliseconds: 1000),
    toastDuration: const Duration(seconds: 3),
    animationCurve: Curves.ease,
    title: const Text(
      'Information',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(title),
    borderRadius: 10,
  ).show(context);
}

void errorToast(context,title) {
  MotionToast.error(
    animationType: AnimationType.fromBottom,
    position: MotionToastPosition.bottom,
    animationDuration: const Duration(milliseconds: 1000),
    toastDuration: const Duration(seconds: 3),
    animationCurve: Curves.ease,
    title: const Text(
      'Error',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(title),
    borderRadius: 10,
  ).show(context);
}
