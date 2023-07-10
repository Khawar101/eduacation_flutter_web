// // ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

// import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
// import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import '../../../../../services/Model/reportModel.dart';
// import 'package:intl/intl.dart';

// import 'intro_builder.dart';

// class DataTables extends StatefulWidget {
//   final List<ReportModel>? reportData;
//   const DataTables({
//     super.key,
//     required this.reportData,
//   });

//   @override
//   State<DataTables> createState() => _DataTablesState();
// }

// class _DataTablesState extends State<DataTables> {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final _verticalScrollController = ScrollController();
//     final _horizontalScrollController = ScrollController();
//     return AdaptiveScrollbar(
//       width: 10,
//       underColor: Colors.grey.withOpacity(0.1),
//       sliderDefaultColor: Colors.grey.withOpacity(0.8),
//       sliderActiveColor: Colors.grey.withOpacity(0.8),
//       sliderActiveDecoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           color: Colors.grey.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(4)),
//       underDecoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           color: Colors.grey.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(4)),
//       sliderDecoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           color: Colors.grey.withOpacity(0.8),
//           borderRadius: BorderRadius.circular(4)),
//       controller: _verticalScrollController,
//       child: AdaptiveScrollbar(
//         width: 10,
//         controller: _horizontalScrollController,
//         position: ScrollbarPosition.bottom,
//         underColor: Colors.grey.withOpacity(0.1),
//         sliderDefaultColor: Colors.grey.withOpacity(0.8),
//         sliderActiveColor: Colors.grey.withOpacity(0.8),
//         sliderActiveDecoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.grey.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(4)),
//         underDecoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.grey.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(4)),
//         sliderDecoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.grey.withOpacity(0.8),
//             borderRadius: BorderRadius.circular(4)),
//         child: SingleChildScrollView(
//           controller: _verticalScrollController,
//           scrollDirection: Axis.vertical,
//           child: SingleChildScrollView(
//             controller: _horizontalScrollController,
//             scrollDirection: Axis.horizontal,
//             child: DataTable(
//               horizontalMargin: 20,
//               showBottomBorder: true,
//               columnSpacing: 20,
//               clipBehavior: Clip.hardEdge,
//               columns: [
//                 DataColumn(
//                   label: SizedBox(
//                     width: screenWidth <= 650
//                         ? screenWidth * 0.5
//                         : screenWidth * 0.2,
//                     child: const Row(
//                       children: [
//                         CustomText(
//                             text: "Customers",
//                             size: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // const DataColumn(
//                 //   label: SizedBox(
//                 //     // width: screenWidth * 0.1,
//                 //     child: CustomText(
//                 //         text: "Status",
//                 //         size: 12,
//                 //         fontWeight: FontWeight.bold,
//                 //         color: Colors.black),
//                 //   ),
//                 // ),
//                 DataColumn(
//                   label: SizedBox(
//                     width: screenWidth <= 650
//                         ? screenWidth * 0.3
//                         : screenWidth * 0.1,
//                     child: const CustomText(
//                         text: "Course",
//                         size: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                 ),
//                 DataColumn(
//                   label: SizedBox(
//                     width: screenWidth * 0.1,
//                     child: const CustomText(
//                         text: "Enrolled",
//                         size: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                 ),
//                 const DataColumn(
//                   label: SizedBox(
//                     // width: screenWidth * 0.1,
//                     child: CustomText(
//                         text: "Finished",
//                         size: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                 ),
//                 DataColumn(
//                   label: SizedBox(
//                     width: screenWidth * 0.1,
//                     child: const CustomText(
//                         text: "Progress",
//                         size: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                 ),
//                 DataColumn(
//                   label: SizedBox(
//                     width: screenWidth * 0.1,
//                     child: const CustomText(
//                         text: "Rating",
//                         size: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ),
//                 ),
//               ],
//               rows: List<DataRow>.generate(widget.reportData?.length ?? 0,
//                   (index) {
//                 ReportModel data = widget.reportData![index];
//                 return DataRow(cells: [
//                   DataCell(introBuilder(data.userKey)),
//                   // DataCell(
//                   //   SizedBox(
//                   //         width: 100,
//                   //     child: Align(
//                   //       alignment: Alignment.centerLeft,
//                   //       child: Container(

//                   //         width: 90,
//                   //         decoration: BoxDecoration(
//                   //           borderRadius: BorderRadius.circular(10),
//                   //           color: Colors.white,
//                   //           border: Border.all(
//                   //             width: 1,
//                   //             color:
//                   //                 index % 3 == 0 ? Colors.red : Colors.green,
//                   //             style: BorderStyle.solid,
//                   //           ),
//                   //         ),
//                   //         child: Row(
//                   //           mainAxisAlignment: MainAxisAlignment.center,
//                   //           children: [
//                   //             Icon(
//                   //               Icons.circle_sharp,
//                   //               color: index % 3 == 0
//                   //                   ? Colors.red
//                   //                   : Colors.green,
//                   //               size: 10,
//                   //             ),
//                   //             const SizedBox(
//                   //               width: 5,
//                   //             ),
//                   //             Padding(
//                   //               padding: const EdgeInsets.symmetric(
//                   //                   vertical: 5, horizontal: 0),
//                   //               child: Text(
//                   //                 index % 3 == 0
//                   //                     ? "Unenrolled"
//                   //                     : widget.status,
//                   //                 textAlign: TextAlign.center,
//                   //                 style: GoogleFonts.ibmPlexSans(
//                   //                   fontSize: 14,
//                   //                   color: index % 3 == 0
//                   //                       ? Colors.red
//                   //                       : Colors.green,
//                   //                   fontWeight: FontWeight.w600,
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ],
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   DataCell(
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         data.courseName.toString(),
//                         style: GoogleFonts.ibmPlexSans(
//                           color: Colors.black45,
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                   DataCell(
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         DateFormat('dd, MM, yy')
//                             .format(data.startDate.toDate())
//                             .toString(),
//                         style: GoogleFonts.ibmPlexSans(
//                           color: Colors.black45,
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                   DataCell(SizedBox(
//                     width: 100,
//                     child: Text(
//                       data.startDate != data.endDate
//                           ? DateFormat('dd, MM, yy')
//                               .format(data.endDate.toDate())
//                               .toString()
//                           : "----------",
//                       style: GoogleFonts.ibmPlexSans(
//                         color: Colors.black45,
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   )),
//                   DataCell(
//                     SizedBox(
//                       width: 200,
//                       child: LinearPercentIndicator(
//                         width: screenWidth * 0.08,
//                         animation: true,
//                         lineHeight: 5.0,
//                         animationDuration: 2500,
//                         percent: data.progress!.toDouble()/100,
//                         trailing: Text(
//                           "${data.progress!.toInt()}%",
//                           style: GoogleFonts.ibmPlexSans(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.black45,
//                           ),
//                         ),
//                         barRadius: const Radius.circular(10),
//                         progressColor: Colors.blueAccent,
//                       ),
//                     ),
//                   ),
//                   DataCell(
//                     SizedBox(
//                       width: screenWidth * 0.2,
//                       child: RatingBar.builder(
//                         wrapAlignment: WrapAlignment.start,
//                         initialRating: data.rating!.toDouble(),
//                         minRating: 1,
//                         direction: Axis.horizontal,
//                         allowHalfRating: true,
//                         itemCount: 5,
//                         itemSize: 20,
//                         ignoreGestures: true,
//                         itemBuilder: (context, _) => const Icon(
//                           Icons.star,
//                           color: Colors.yellow,
//                         ),
//                         onRatingUpdate: (rating) {
//                           //print(rating);
//                         },
//                       ),
//                     ),
//                   ),
//                 ]);
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../../services/Model/reportModel.dart';
import 'package:intl/intl.dart';

import 'intro_builder.dart';

class DataTables extends StatefulWidget {
  final List<ReportModel>? reportData;
  const DataTables({
    super.key,
    required this.reportData,
  });

  @override
  State<DataTables> createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _horizontalScrollController,
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.horizontal,
          controller: _horizontalScrollController,
          child: SingleChildScrollView(
                            controller: _verticalScrollController,
                scrollDirection: Axis.vertical,
        
            child: Container(
              height: 120,
              child: DataTable(
                horizontalMargin: 0,
                showBottomBorder: true,
                columnSpacing: 20,
                clipBehavior: Clip.hardEdge,
                columns: [
                  DataColumn(
                    label: SizedBox(
                      width: screenWidth <= 650
                          ? screenWidth * 0.5
                          : screenWidth * 0.2,
                      child: const Row(
                        children: [
                          CustomText(
                            text: "Customers",
                            size: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: screenWidth <= 650
                          ? screenWidth * 0.3
                          : screenWidth * 0.1,
                      child: const CustomText(
                        text: "Course",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: screenWidth * 0.1,
                      child: const CustomText(
                        text: "Enrolled",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: SizedBox(
                      child: CustomText(
                        text: "Finished",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: screenWidth * 0.1,
                      child: const CustomText(
                        text: "Progress",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: screenWidth * 0.1,
                      child: const CustomText(
                        text: "Rating",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(widget.reportData?.length ?? 0,
                    (index) {
                  ReportModel data = widget.reportData![index];
                  return DataRow(
                    cells: [
                      DataCell(introBuilder(data.userKey)),
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(
                            data.courseName.toString(),
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(
                            DateFormat('dd, MM, yy')
                                .format(data.startDate.toDate())
                                .toString(),
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(
                            data.startDate != data.endDate
                                ? DateFormat('dd, MM, yy')
                                    .format(data.endDate.toDate())
                                    .toString()
                                : "----------",
                            style: GoogleFonts.ibmPlexSans(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 200,
                          child: LinearPercentIndicator(
                            width: screenWidth * 0.08,
                            animation: true,
                            lineHeight: 5.0,
                            animationDuration: 2500,
                            percent: data.progress!.toDouble() / 100,
                            trailing: Text(
                              "${data.progress!.toInt()}%",
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                            ),
                            barRadius: const Radius.circular(10),
                            progressColor: Colors.blueAccent,
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: screenWidth * 0.2,
                          child: RatingBar.builder(
                            wrapAlignment: WrapAlignment.start,
                            initialRating: data.rating!.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            onRatingUpdate: (rating) {
                              //print(rating);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
