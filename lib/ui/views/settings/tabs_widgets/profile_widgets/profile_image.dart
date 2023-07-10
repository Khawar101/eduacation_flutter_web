// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/widgets/networkImage.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../settings_viewmodel.dart';

class profileImage extends StackedView<SettingsViewModel> {
  const profileImage({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        networkImage(viewModel.userdata.profile, 60, 60, true),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: viewModel.uploadProfile,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: const Color(0xff4873a6).withOpacity(0.7),
                  shape: BoxShape.circle),
              child: const Icon(Icons.camera_alt_outlined,
                  color: Color(0xffffffff), size: 17),
            ),
          ),
        ),
      ],
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
