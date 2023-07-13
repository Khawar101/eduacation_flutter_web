
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/Model/userData.dart';
import '../../../../../services/dashboard_service.dart';
import '../../../../../utils/loading.dart';
import '../../../../widgets/common/sized_text/sized_text.dart';
import '../../../../widgets/networkImage.dart';
import '../../dashboard_viewmodel.dart';

class IntroBuilder extends ViewModelWidget<DashboardViewModel> {
  final String uID;
   const IntroBuilder( {super.key,required this.uID});
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
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
            networkImage(
              _userData.profile,
              35,
              35,
              true,
            ),
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
  );}
}