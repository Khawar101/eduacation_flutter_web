import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CirclePercent extends StatefulWidget {
  final double percent, amount;
  final String mode;
  const CirclePercent(
      {super.key,
      required this.mode,
      required this.amount,
      required this.percent});

  @override
  State<CirclePercent> createState() => _CirclePercentState();
}

class _CirclePercentState extends State<CirclePercent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 70,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black45,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularPercentIndicator(
            radius: 20.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 5.0,
            percent: (widget.percent) / 100,
            center: const Icon(
              Icons.arrow_back,
              size: 14,
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.white,
            progressColor: Colors.deepPurple,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: widget.mode,
                  size: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black38),
              CustomText(
                  text: "\$" + widget.amount.toString(),
                  size: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ],
          )
        ],
      ),
    );
  }
}
