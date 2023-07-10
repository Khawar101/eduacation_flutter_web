// ignore_for_file: unnecessary_new

import 'package:education_flutter_web/ui/views/account/widget/card_drawer.dart';
import 'package:education_flutter_web/ui/views/account/widget/exchange_view.dart';
import 'package:education_flutter_web/ui/views/account/widget/income_tab.dart';
import 'package:education_flutter_web/ui/views/account/widget/linear_chart.dart';
import 'package:education_flutter_web/ui/views/account/widget/statistics.dart';
import 'package:education_flutter_web/ui/views/account/widget/transactions_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StackedView<AccountViewModel> {
  //final GlobalKey<ScaffoldState> keyss;
  const AccountView({Key? key,}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AccountViewModel viewModel,
    Widget? child,
  ) {
    GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.9,
      child: Scaffold(
        key: _key,
      endDrawer: const Drawer(
        width: 350,
        backgroundColor: Colors.white,
        //key: _key,
        child: CardDrawer(),
      ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth,
                    height:
                        screenWidth > 800 ? screenHeight * 0.3 : screenHeight * 0.7,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        screenWidth > 800
                            ? const Row(
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
                              )
                            : const Column(
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
                        InkWell(
                          onTap: (){
                          _key.currentState?.openEndDrawer();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Income_Tab(),
                  const Account_Chart(),
                  screenWidth > 800
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.38,
                              child: const Transactions_View(),
                            ),
                            SizedBox(
                              width: screenWidth * 0.38,
                              child: const Exchange_View(),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.9,
                              child: const Transactions_View(),
                            ),
                            SizedBox(
                              width: screenWidth * 0.9,
                              child: const Exchange_View(),
                            ),
                          ],
                        ),
                ],
              ),
            ),
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
