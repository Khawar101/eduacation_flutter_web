import 'package:education_flutter_web/services/Model/reportModel.dart';
import 'package:education_flutter_web/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/data_table/data_table.dart';
import 'package:education_flutter_web/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReportBuilder extends StackedView<DashboardViewModel> {
  const ReportBuilder({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width < 400
          ? width * 2.5
          : width < 600
              ? width * 2.1
              : width < 900
                  ? width * 1.3
                  : width * 0.85,
      child: StreamBuilder<List<ReportModel>>(
        stream: viewModel.dashboardService.reportStream(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ReportModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading(100));
          }

          return DataTables(snapshot.data);
        },
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
