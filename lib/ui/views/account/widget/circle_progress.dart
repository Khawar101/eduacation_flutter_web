import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CirclePercent extends StatefulWidget {
  const CirclePercent({super.key});

  @override
  State<CirclePercent> createState() => _CirclePercentState();
}

class _CirclePercentState extends State<CirclePercent> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 5.0,
      percent: 0.7,
      center: const Icon(
        Icons.arrow_back,
        size: 14,
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.white,
      progressColor: Colors.deepPurple,
    );
  }
}
