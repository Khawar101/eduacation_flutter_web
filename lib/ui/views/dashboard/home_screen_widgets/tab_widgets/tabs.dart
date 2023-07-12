// ignore_for_file: unused_field

import 'dart:developer';

import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/user_data.dart';
import 'package:education_flutter_web/ui/views/dashboard/widgets/report_builder.dart';
import 'package:flutter/material.dart';

class DashTabBar extends StatefulWidget {
  const DashTabBar({Key? key}) : super(key: key);

  @override
  _DashTabBarState createState() => _DashTabBarState();
}

class _DashTabBarState extends State<DashTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_tabSelect);
  }

  void _tabSelect() {
    log("Tab index is ${_tabController.index}");
    setState(() {
      _currentIndex = _tabController.index;
    });
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
            controller: _tabController,
            isScrollable: true,
            indicator: BoxDecoration(
              color: const Color(0xff4873a6).withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.transparent),
            ),
            indicatorWeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.all(0),
            labelPadding: const EdgeInsets.only(right: 20, left: 20),
            indicatorPadding: const EdgeInsets.only(right: 0),
            labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
            unselectedLabelStyle: const TextStyle(color: Colors.red),
            unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
            labelColor: Colors.white,
            tabs: const [
              Tab(text: "View All"),
              Tab(text: "Enrolled"),
              Tab(text: "Active now"),
              Tab(text: "Unenrolled"),
            ]),
        const SizedBox(height: 10),
        _tabController.index == 0
            ?  const ReportBuilder()
            : _tabController.index == 1
                ? const DataTableExample()
                : _tabController.index == 2
                    ? const Text("User Body")
                    : const Text("Home Body"),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height - 250,
        //   child: TabBarView(
        //     controller: _tabController,
        //     children: [
        //       const Column(
        //         children: [
        //           SizedBox(
        //             // height: MediaQuery.of(context).size.height * 1,
        //             // width: MediaQuery.of(context).size.width * 1,
        //             child: ReportBuilder(),
        //           ),
        //         ],
        //       ),
        //       SizedBox(
        //         height: MediaQuery.of(context).size.height,
        //         // width: MediaQuery.of(context).size.width * 1,
        //         child: const DataTableExample(),
        //       ),
        //       const Text("User Body"),
        //       const Text("Home Body"),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
