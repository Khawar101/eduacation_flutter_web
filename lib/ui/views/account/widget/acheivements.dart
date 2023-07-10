import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

class Acheivements extends StatefulWidget {
  final IconData iconstyle;
  final String name, description;
  const Acheivements({super.key, required this.name, required this.description, required this.iconstyle});

  @override
  State<Acheivements> createState() => _AcheivementsState();
}

class _AcheivementsState extends State<Acheivements> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            widget.iconstyle,
            color: Colors.deepPurple,
            size: 18,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.name,
                  size: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 30, 4, 73),
                ),
                CustomText(
                  text: widget.description,
                  size: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
