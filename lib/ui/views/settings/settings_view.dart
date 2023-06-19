import 'package:education_flutter_web/ui/views/settings/widgets/setteing_tabs.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    //  var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - 50;
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: "Account Settings", color: Colors.black),
            SizedBox(height: 20),
            tabSection(context),
        
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
