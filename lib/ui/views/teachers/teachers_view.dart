import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'teachers_viewmodel.dart';

class TeachersView extends StackedView<TeachersViewModel> {
  const TeachersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeachersViewModel viewModel,
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
  TeachersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeachersViewModel();
}
