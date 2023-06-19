import 'package:education_flutter_web/ui/views/settings/widgets/my_profile.dart';
import 'package:flutter/material.dart';

Widget tabSection(context) {
  return DefaultTabController(
    length: 7,
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
              Tab(text: "My Profile"),
              Tab(text: "Security"),
              Tab(text: "Teams"),
              Tab(text: "Team Member"),
              Tab(text: "Notification"),
              Tab(text: "Billing"),
              Tab(text: "Data Export"),
            ]),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: const TabBarView(children: [
            MyProfile(),
            Text("Articles Body"),
            Text("User Body"),
            Text("Home Body"),
            Text("Articles Body"),
            Text("User Body"),
            Text("User Body"),
          ]),
        )
      ],
    ),
  );
}
