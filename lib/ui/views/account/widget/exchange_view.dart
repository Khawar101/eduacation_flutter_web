// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

import 'exchange.dart';

class Exchange_View extends StatefulWidget {
  const Exchange_View({super.key});

  @override
  State<Exchange_View> createState() => _Exchange_ViewState();
}

class _Exchange_ViewState extends State<Exchange_View> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: "Exchange",
            size: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        Exchange(
          buyAmt: "1150.33",
          sellAmt: "1240",
          eurRate: "1",
          usdRate: "1",
        ),
      ],
    );
  }
}
