import 'package:education_flutter_web/ui/views/account/widget/exchange_view.dart';
import 'package:education_flutter_web/ui/views/account/widget/income_tab.dart';
import 'package:education_flutter_web/ui/views/account/widget/statistics.dart';
import 'package:education_flutter_web/ui/views/account/widget/transactions_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StackedView<AccountViewModel> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AccountViewModel viewModel,
    Widget? child,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Row(
                  children: [
                    Statistics(
                      heading: "Education",
                      money: "350.00",
                      iconss: Icons.cast_for_education_outlined,
                    ),
                    Statistics(
                      heading: "Travel",
                      money: "850.00",
                      iconss: Icons.map_outlined,
                    ),
                    Statistics(
                      heading: "Shopping",
                      money: "420.00",
                      iconss: Icons.shopping_bag_outlined,
                    ),
                  ],
                ),
              ),
              const Income_Tab(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  SizedBox(
                    width: screenWidth*0.37,
                    child: Transactions_View()),
                  SizedBox(
                    width: screenWidth*0.37,
                    child: Exchange_View()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AccountViewModel();
}
