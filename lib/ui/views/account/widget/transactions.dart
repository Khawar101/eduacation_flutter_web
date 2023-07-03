import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({
    super.key,
    required this.sign,
    required this.title,
    required this.purpose,
    required this.amount,
  });
  final String sign, title, purpose, amount;
  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.black45,
                ),
              ),
              child: CustomText(
                text: widget.sign,
                size: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: widget.title,
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                  CustomText(
                      text: widget.purpose,
                      size: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black38),
                ],
              ),
            ),
          ],
        ),
        CustomText(
          text: widget.amount,
          size: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ],
    );
  }
}
