import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/charts.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/enrolment.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/head_buttons.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/stats.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/user_data.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/user_head.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height*0.87,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              const HeadButtons(),
              const SizedBox(
                height: 30,
              ),
               LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1000) {
            return const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Stats(
                    headingText: 'Total Member',
                    containerText: '20',
                    number: '1,620',
                  ),
                  Stats(
                    headingText: 'Enrolled Member',
                    containerText: '15',
                    number: '1,220',
                  ),
                  Stats(
                    headingText: 'Active Now ',
                    containerText: '12',
                    number: '208',
                  ),
                ],
              );
          } else {
            return const Column(
               
                children: [
                Stats(
                    headingText: 'Total Member',
                    containerText: '20',
                    number: '1,620',
                  ),
                  SizedBox(height: 10),
                  Stats(
                    headingText: 'Enrolled Member',
                    containerText: '15',
                    number: '1,220',
                  ),
                    SizedBox(height: 10),
                  Stats(
                    headingText: 'Active Now ',
                    containerText: '12',
                    number: '208',
                  ),
                ],
              );
          }
        },
      ),
                
              const SizedBox(
                height: 20,
              ),
              const Enrolment(),
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width * 1,
                child: const LineChartSample2(),
              ),
              const UsersHead(),
              const UsersData(
                name: "Olivia Rhye",
                email: "hello@oliviarhye.com",
                status: "Enrolled",
                course: "UI Masterclass",
                enroll_date: "Jan4 ,2022",
                progress_percent: 0.7,
                ratings: 5,
              ),
              const UsersData(
                name: "Olivia Rhye",
                email: "hello@oliviarhye.com",
                status: "Enrolled",
                course: "UI Masterclass",
                enroll_date: "Jan4 ,2022",
                progress_percent: 0.7,
                ratings: 5,
              ),
              const UsersData(
                name: "Olivia Rhye",
                email: "hello@oliviarhye.com",
                status: "Enrolled",
                course: "UI Masterclass",
                enroll_date: "Jan4 ,2022",
                progress_percent: 0.7,
                ratings: 5,
              ),
              const UsersData(
                name: "Olivia Rhye",
                email: "hello@oliviarhye.com",
                status: "Enrolled",
                course: "UI Masterclass",
                enroll_date: "Jan4 ,2022",
                progress_percent: 0.7,
                ratings: 5,
              ),
              const UsersData(
                name: "Olivia Rhye",
                email: "hello@oliviarhye.com",
                status: "Enrolled",
                course: "UI Masterclass",
                enroll_date: "Jan4 ,2022",
                progress_percent: 0.7,
                ratings: 5,
              ),
              const UsersData(
                name: "Olivia Rhye",
                email: "hello@oliviarhye.com",
                status: "Enrolled",
                course: "UI Masterclass",
                enroll_date: "Jan4 ,2022",
                progress_percent: 0.7,
                ratings: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
