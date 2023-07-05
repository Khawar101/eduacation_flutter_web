// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../settings_viewmodel.dart';
import 'profile_widgets/heading_info.dart';
import 'profile_widgets/personal_info.dart';

class MyProfile extends StackedView<SettingsViewModel> {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    viewModel.usernameController.text = viewModel.userdata.username ?? "";
    viewModel.firstNameController.text = viewModel.userdata.firstName ?? "";
    viewModel.lastNameController.text = viewModel.userdata.lastName ?? "";
    viewModel.emailController.text = viewModel.userdata.email ?? "";
    viewModel.phoneController.text = viewModel.userdata.phoneNo ?? "";
    viewModel.bioController.text = viewModel.userdata.bio ?? "";
    viewModel.addressController.text = viewModel.userdata.address ?? "";
    viewModel.cityController.text = viewModel.userdata.city ?? "";
    viewModel.countryController.text = viewModel.userdata.country ?? "";
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Profile",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            headingInfo(viewModel, context),
            const SizedBox(height: 20),
            personalInformation(viewModel, context),
            const SizedBox(height: 50)
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
