import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEBF4FB),
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width < 500
                      ? 50
                      : 280
                  : 350,
              alignment: Alignment.topCenter,
              color: const Color(0xFFEBF4FB),
              child: Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 60,
                  color: const Color(0xFFEBF4FB),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Madona Oster",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 11,
                    ),
                    Text(
                      "  Active now",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
