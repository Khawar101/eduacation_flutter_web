import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'verify_viewmodel.dart';

class VerifyView extends StackedView<VerifyViewModel> {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VerifyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  VerifyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyViewModel();
}
