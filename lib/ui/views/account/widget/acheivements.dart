import 'package:flutter/material.dart';

class Acheivements extends StatefulWidget {
  const Acheivements({super.key});

  @override
  State<Acheivements> createState() => _AcheivementsState();
}

class _AcheivementsState extends State<Acheivements> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star)
      ],
    );
  }
}