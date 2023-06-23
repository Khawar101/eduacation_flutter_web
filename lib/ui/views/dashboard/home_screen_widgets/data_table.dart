import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DataTables extends StatefulWidget {
  const DataTables({
    super.key,
    required this.status,
  });
  final name = "Olivia Rhye",
      email = "hello@oliviarhye.com",
      status,
      course = "UI Masterclass",
      enroll_date = "Jan4 ,2022";
  final double progress_percent = 0.7, ratings = 4.5;

  @override
  State<DataTables> createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        showBottomBorder: true,
        columnSpacing: 10,
        columns: [
          DataColumn(
            label: SizedBox(
              width: screenWidth <= 650
                  ? MediaQuery.of(context).size.width * 0.6
                  : MediaQuery.of(context).size.width * 0.2,
              child: const Row(
                children: [
                  CustomText(
                      text: "Customers",
                      size: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ],
              ),
            ),
          ),
          DataColumn(
            label: Visibility(
              visible: screenWidth >= 900,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: const CustomText(
                    text: "Status",
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: screenWidth <= 650
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.1,
              child: const CustomText(
                  text: "Course",
                  size: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          DataColumn(
            label: Visibility(
              visible: screenWidth >= 600,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: const CustomText(
                    text: "Enrolled",
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          DataColumn(
            label: Visibility(
              visible: screenWidth >= 900,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: const CustomText(
                    text: "Progress",
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          DataColumn(
            label: Visibility(
              visible: screenWidth >= 1000,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: const CustomText(
                    text: "Rating",
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
        rows: List<DataRow>.generate(
            10,
            (index) => DataRow(cells: [
                  DataCell(
                    SizedBox(
                      width: screenWidth <= 650
                          ? MediaQuery.of(context).size.width * 0.6
                          : MediaQuery.of(context).size.width * 0.2,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/person.png",
                            height: 35,
                            width: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: widget.name +
                                        " " +
                                        (index + 1).toString(),
                                    size: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                Text(
                                  widget.email,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.ibmPlexSans(
                                    fontSize: 14,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Visibility(
                      visible: screenWidth >= 900,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            //height: 30,
                            width: MediaQuery.of(context).size.width * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color:
                                    index % 3 == 0 ? Colors.red : Colors.green,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle_sharp,
                                  color: index % 3 == 0
                                      ? Colors.red
                                      : Colors.green,
                                  size: 10,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  child: Text(
                                    index % 3 == 0
                                        ? "Unenrolled"
                                        : widget.status,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.ibmPlexSans(
                                      fontSize: 14,
                                      color: index % 3 == 0
                                          ? Colors.red
                                          : Colors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: screenWidth <= 650
                          ? MediaQuery.of(context).size.width * 0.3
                          : MediaQuery.of(context).size.width * 0.1,
                      child: CustomText(
                          text: widget.course,
                          size: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45),
                    ),
                  ),
                  DataCell(
                    Visibility(
                      visible: screenWidth >= 600,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Text(
                          widget.enroll_date,
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Visibility(
                      visible: screenWidth >= 900,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width * 0.12,
                          animation: true,
                          lineHeight: 5.0,
                          animationDuration: 2500,
                          percent: widget.progress_percent,
                          trailing: Text(
                            "${widget.progress_percent * 100}%",
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
                  ),
                  DataCell(
                    Visibility(
                      visible: screenWidth >= 1000,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: RatingBar.builder(
                          wrapAlignment: WrapAlignment.start,
                          initialRating: widget.ratings,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
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
                  ),
                ])),
      ),
    );
  }
}
