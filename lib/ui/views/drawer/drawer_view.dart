import 'package:education_flutter_web/ui/common/app_assets.dart';
// import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/common/sized_text/sized_text.dart';
import 'drawer_viewmodel.dart';

class DrawerView extends StackedView<DrawerViewModel> {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DrawerViewModel viewModel,
    Widget? child,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      height: 46,
                      child: DrawerHeader(
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.fromLTRB(0, 2, 4, 0),
                        child: ListTile(
                          leading: Image.asset(
                            logo,
                            width: 30,
                          ),
                          title: Visibility(
                            visible: screenWidth >= 900,
                            child: const CustomText(
                              text: "Education App",
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Home')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(0);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_box,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Account')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(1);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.contacts_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Contacts')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(2);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.groups_2_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Teachers')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(3);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.book_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Courses')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(4);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.menu_book,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('E-Book')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(5);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.keyboard_command_key_rounded,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('E-Learning')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(6);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Settings')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(7);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Logout')),
                      minLeadingWidth: 0.009,
                      onTap: viewModel.navigateLogin,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                    color: Colors.red.withOpacity(0.2),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 30, top: 8.0, right: 30, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.vertical_distribute,
                                    size: 15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.notifications_outlined, size: 18),
                                  SizedBox(width: 8),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.black,
                                    // backgroundImage: NetworkImage(viewModel
                                    //     .loginService.UserData.profile
                                    //     .toString()),
                                  ),
                                  SizedBox(width: 4),
                                  ButtonText(
                                      text: "Muhammad Mudassir",
                                      // viewModel
                                      //     .loginService.UserData.username
                                      //     .toString(),
                                      color: Colors.black),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(child: viewModel.pages[viewModel.pageNo]),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  @override
  DrawerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DrawerViewModel();
}
