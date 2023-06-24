import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/data_table.dart';
import 'package:flutter/material.dart';

Widget tab_Section(context) {
  return DefaultTabController(
    length: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar(
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: TabBarView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.8,
                   width: MediaQuery.of(context).size.width * 1,
                    child:  const DataTables(title: 'dfdf',
                      status: "Enrolled",
                    ),
                  ),
                ],
              ),
              const Text("User Body"),
              const Text("User Body"),
              const Text("Home Body"),
            ],
          ),
        )
      ],
    ),
  );
}
