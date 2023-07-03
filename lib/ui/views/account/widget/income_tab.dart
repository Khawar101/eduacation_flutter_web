import 'package:flutter/material.dart';

import '../../../widgets/common/sized_text/sized_text.dart';

const List<String> list = ['Month', 'Week', 'Year'];

class Income_Tab extends StatefulWidget {
  const Income_Tab({super.key});

  @override
  State<Income_Tab> createState() => _Income_TabState();
}

class _Income_TabState extends State<Income_Tab> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CustomText(
                  text: "Income",
                  size: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const CustomText(
                    text: "Sort By: ",
                    size: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54),
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
                    Icons.file_download_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
