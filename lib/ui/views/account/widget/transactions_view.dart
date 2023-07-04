import 'package:education_flutter_web/ui/views/account/widget/transactions.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';

const List<String> list = ['All', 'Sent', 'Received'];

class Transactions_View extends StatefulWidget {
  const Transactions_View({super.key});

  @override
  State<Transactions_View> createState() => _Transactions_ViewState();
}

class _Transactions_ViewState extends State<Transactions_View> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: "Transactions",
                size: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
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
                  value: dropdownValue,
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
                      dropdownValue = value!;
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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: CustomText(
              text: "Today",
              size: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black45),
        ),
        Transaction(
          sign: "S",
          title: "P&B",
          purpose: "Shopping",
          amount: "-\$199.00",
        ),
        Transaction(
          sign: "R",
          title: "From Ann Jones",
          purpose: "Shopping",
          amount: "-\$199.00",
        ),
        Transaction(
          sign: "S",
          title: "P&B",
          purpose: "Shopping",
          amount: "-\$199.00",
        ),
      ],
    );
  }
}
