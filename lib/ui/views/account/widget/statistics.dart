import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  final IconData iconss;
  final String heading;
  final String money;
  const Statistics(
      {super.key,
      required this.iconss,
      required this.heading,
      required this.money});
  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: const EdgeInsets.all(20),
      height: screenHeight * 0.07,
      width: screenWidth * 0.17,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              widget.iconss,
              color: Colors.white,
              size: screenHeight * 0.025,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: widget.heading,
                size: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white54,
              ),
              CustomText(
                text: "\$ " + widget.money,
                size: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
