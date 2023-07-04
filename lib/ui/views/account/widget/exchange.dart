import 'package:flutter/material.dart';

import '../../../widgets/common/sized_text/sized_text.dart';

const List<String> list = ['USD', 'EUR', 'GBP'];

class Exchange extends StatefulWidget {
  const Exchange({
    super.key,
    required this.sellAmt,
    required this.buyAmt,
    required this.usdRate,
    required this.eurRate,
  });
  final String sellAmt, buyAmt, usdRate, eurRate;
  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: "Sell",
                        size: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                      ),
                      CustomText(
                        text: widget.sellAmt,
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.black38,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: DropdownButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  value: dropdownValue1,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.blue,
                  ),
                  elevation: 0,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue1 = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Colors.black12,
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.black45,
                  ),
                ),
                child: const Icon(
                  Icons.repeat,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Divider(
                color: Colors.black12,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: "Buy",
                        size: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                      ),
                      CustomText(
                        text: widget.buyAmt,
                        size: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.black38,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: DropdownButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  value: dropdownValue2,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.blue,
                  ),
                  elevation: 0,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue2 = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                CustomText(
                  text: "1 USD = 0.93 EUR",
                  size: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black38,
                ),
                CustomText(
                  text: "1 EUR = 1.08 USD",
                  size: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black38,
                ),
              ],
            ),
            Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: const CustomText(
                  text: "Confirm",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
