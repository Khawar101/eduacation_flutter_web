import 'package:education_flutter_web/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';
import '../../../../../services/Model/reportModel.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';
import 'intro_builder.dart';
import 'package:intl/intl.dart';

class DataTables extends StackedView<DashboardViewModel> {
  final List<ReportModel>? reportData;
  DataTables(this.reportData, {Key? key}) : super(key: key);
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();
  @override
  void onDispose(DashboardViewModel viewModel) {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return DataTable(
      horizontalMargin: 10,
      showBottomBorder: true,
      columnSpacing: 0,
      checkboxHorizontalMargin: 0,
      clipBehavior: Clip.none,
      columns: const [
        DataColumn(
          label: SizedBox(
            width: 100,
            child: Row(
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
            width: 100,
            child: CustomText(
              text: "Course",
              size: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 100,
            child: CustomText(
              text: "Enrolled",
              size: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 100,
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
            width: 100,
            child: CustomText(
              text: "Progress",
              size: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 100,
            child: CustomText(
              text: "Rating",
              size: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
      // reportData!.length
      rows: List<DataRow>.generate(reportData!.length, (index) {
        ReportModel data = reportData![index];
        return DataRow(
          cells: [
            DataCell(IntroBuilder(uID: data.userKey ?? "")),
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
                width: 140,
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * 0.08,
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
                width: 100,
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
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
