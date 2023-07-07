import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

import 'circle_progress.dart';

class CardDrawer extends StatefulWidget {
  const CardDrawer({super.key});

  @override
  State<CardDrawer> createState() => _CardDrawerState();
}

class _CardDrawerState extends State<CardDrawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CustomText(
                    text: "Current account",
                    size: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38),
                CustomText(
                    text: "\$4328.00",
                    size: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Row(
                    children: [
                      CirclePercent()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
