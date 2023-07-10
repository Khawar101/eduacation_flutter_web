// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// class UsersData extends StatefulWidget {
//   const UsersData(
//       {super.key,
//       required this.name,
//       required this.email,
//       required this.status,
//       required this.course,
//       required this.enroll_date,
//       required this.progress_percent,
//       required this.ratings});
//   // ignore: prefer_typing_uninitialized_variables
//   final name, email, status, course, enroll_date;
//   final double progress_percent, ratings;

//   @override
//   State<UsersData> createState() => _UsersDataState();
// }

// class _UsersDataState extends State<UsersData> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Checkbox(
//                   fillColor: const MaterialStatePropertyAll(Colors.black26),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   value: false,
//                   onChanged: null),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.25,
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       "assets/images/person.png",
//                       height: 35,
//                       width: 35,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 5, horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.name,
//                             style: GoogleFonts.ibmPlexSans(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             widget.email,
//                             style: GoogleFonts.ibmPlexSans(
//                               color: Colors.black38,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.15,
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     height: 30,
//                     width: 90,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: Colors.green,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.circle_sharp,
//                           color: Colors.green,
//                           size: 10,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           widget.status,
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.ibmPlexSans(
//                             fontSize: 14,
//                             color: Colors.green,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.1,
//                 child: Text(
//                   widget.course,
//                   style: GoogleFonts.ibmPlexSans(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w300,
//                     color: Colors.black45,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.1,
//                 child: Text(
//                   widget.enroll_date,
//                   style: GoogleFonts.ibmPlexSans(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w300,
//                     color: Colors.black45,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.2,
//                 child: LinearPercentIndicator(
//                   width: MediaQuery.of(context).size.width * 0.12,
//                   animation: true,
//                   lineHeight: 10.0,
//                   animationDuration: 2500,
//                   percent: widget.progress_percent,
//                   trailing: Text(
//                     "${widget.progress_percent * 100}%",
//                     style: GoogleFonts.ibmPlexSans(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.black45,
//                     ),
//                   ),
//                   barRadius: const Radius.circular(10),
//                   progressColor: const Color.fromARGB(255, 3, 12, 65),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.1,
//                 child: const Row(
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: Color.fromARGB(255, 3, 12, 65),
//                       size: 18,
//                     ),
//                     Icon(
//                       Icons.star,
//                       color: Color.fromARGB(255, 3, 12, 65),
//                       size: 18,
//                     ),
//                     Icon(
//                       Icons.star,
//                       color: Color.fromARGB(255, 3, 12, 65),
//                       size: 18,
//                     ),
//                     Icon(
//                       Icons.star,
//                       color: Color.fromARGB(255, 3, 12, 65),
//                       size: 18,
//                     ),
//                     Icon(
//                       Icons.star,
//                       color: Color.fromARGB(255, 3, 12, 65),
//                       size: 18,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const Divider(
//             height: 15,
//             thickness: 0.5,
//             color: Colors.black38,
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  static const int numItems = 50;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Number'),
          ),
        ],
        rows: List<DataRow>.generate(
          numItems,
          (int index) => DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              // All rows will have the same selected color.
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
              }
              // Even rows will have a grey color.
              if (index.isEven) {
                return Colors.grey.withOpacity(0.3);
              }
              return null; // Use default value for other states and odd rows.
            }),
            cells: <DataCell>[DataCell(Text('Row $index'))],
            selected: selected[index],
            onSelectChanged: (bool? value) {
              setState(() {
                selected[index] = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
