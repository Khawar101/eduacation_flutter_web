import 'package:education_flutter_web/services/Model/reportModel.dart';
import 'package:education_flutter_web/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:education_flutter_web/utils/loading.dart';
import 'package:flutter/material.dart';

import '../home_screen_widgets/data_table.dart';

Widget reportBuilder(DashboardViewModel viewModel) {
  return StreamBuilder<List<ReportModel>>(
    stream: viewModel.dashboardService.reportStream(),
    builder: (BuildContext context, AsyncSnapshot<List<ReportModel>> snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Loading(100);
      }

      return DataTables(reportData: snapshot.data);
    },
  );
}
//
