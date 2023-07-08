// ignore_for_file: unused_local_variable

import 'package:education_flutter_web/app/app.locator.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:education_flutter_web/ui/widgets/networkImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../services/Model/userData.dart';
import '../../../../../../services/dashboard_service.dart';
import '../../../../../../utils/loading.dart';

Widget introBuilder(uID) {
  final _dashboardService = locator<DashboardService>();

  return StreamBuilder(
    stream: _dashboardService.publisherStream(uID),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Loading(20);
      }
      userData _userData = userData.fromJson(snapshot.data.data());
      return SizedBox(
        width: 270,
        child: Row(
          children: [
              networkImage(_userData.profile, 35, 35, true,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: _userData.username.toString(),
                        size: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    Text(
                      _userData.email.toString(),
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
            ),
          ],
        ),
      );
    },
  );
}
