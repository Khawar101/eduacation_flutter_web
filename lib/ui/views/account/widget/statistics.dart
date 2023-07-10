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
      padding: EdgeInsets.symmetric(
          vertical: screenWidth / 80, horizontal: screenHeight / 80),
      margin: EdgeInsets.all(screenWidth / 100),
      height: screenWidth > 800 ? screenHeight * 0.08 : screenHeight * 0.15,
      width: screenWidth > 800 ? screenWidth * 0.2 : screenWidth * 0.6,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth / 80),
            child: Icon(
              widget.iconss,
              color: Colors.white,
              size: 26,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: widget.heading,
                size: 18,
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
