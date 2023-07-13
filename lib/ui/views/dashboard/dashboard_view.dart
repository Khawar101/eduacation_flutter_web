import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/head_buttons.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/state_manage.dart';
import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/tab_widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  DashboardView({Key? key}) : super(key: key);
  // final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();
  // @override
  // void onDispose(DashboardViewModel viewModel) {
  //   _verticalScrollController.dispose();
  //   _horizontalScrollController.dispose();
  //   super.onDispose(viewModel);
  // }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    //   final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
     
      color: Colors.white,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _horizontalScrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _horizontalScrollController,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadButtons(),
                  const SizedBox(
                    height: 30,
                  ),
                  stateManage(context),
                  const SizedBox(
                    height: 20,
                  ),
                  const DashTabBar(),
                ],
              ),
            ),
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
