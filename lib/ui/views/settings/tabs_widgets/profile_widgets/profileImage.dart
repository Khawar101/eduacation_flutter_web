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
        Center(
          child: viewModel.profileService.profile == ""
              ? const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('assets/images/download.jpeg'),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                )
              : CircleAvatar(
                  radius: 65,
                  backgroundImage:
                      NetworkImage(viewModel.profileService.profile),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                ),
        ),
        Center(
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: viewModel. uploadProfile,
                child: Container(
                  height: 40,
                  width: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(Icons.edit_outlined,
                      color: Color(0xffffffff), size: 30),
                ),
              ),
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
