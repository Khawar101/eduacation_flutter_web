import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

import 'acheivements.dart';
import 'circle_progress.dart';
import 'credit_card.dart';

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
            const CreditCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
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
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.black45)),
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CirclePercent(mode: "Income", amount: 840, percent: 80),
                CirclePercent(mode: "Outcome", amount: 460, percent: 60),
                Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Row(
                    children: [CirclePercent()],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
                text: "Achievements",
                size: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
            const Acheivements(
              iconstyle: Icons.star_border,
              name: "Friends",
              description: "You have 4 friends",
            )
          ],
        ),
      ),
    );
  }
}
