import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'forgetpassword_viewmodel.dart';

class ForgetpasswordView extends StackedView<ForgetpasswordViewModel> {
  const ForgetpasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetpasswordViewModel viewModel,
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
  ForgetpasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgetpasswordViewModel();
}
