import 'package:education_flutter_web/ui/common/app_assets.dart';
import 'package:education_flutter_web/ui/widgets/networkImage.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/common/sized_text/sized_text.dart';
import 'drawer_viewmodel.dart';

class DrawerView extends StackedView<DrawerViewModel> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(DrawerViewModel viewModel) {
    viewModel.restoreData();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    DrawerViewModel viewModel,
    Widget? child,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: screenWidth * 0.18,
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
                        color: const Color(0xff4873a6).withOpacity(0.7),
                        Icons.account_box,
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Account')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        //_key.currentState?.openEndDrawer();
                        viewModel.updatePage(1);
                        //AccountView(keyss: _key,);
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
                        Icons.chat,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: Visibility(
                          visible: screenWidth >= 900,
                          child: const Text('Chats')),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        viewModel.updatePage(3);
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
                        viewModel.updatePage(4);
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
                        viewModel.updatePage(5);
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
                        viewModel.updatePage(6);
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
                        viewModel.updatePage(7);
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
                        viewModel.updatePage(8);
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
                        onTap: viewModel.removeDataFromSpAndGoToLogin),
                  ],
                ),
              ),
            ),
            SizedBox(
                width: screenWidth * 0.82,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, top: 8.0, right: 30, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.vertical_distribute,
                                size: 15,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.notifications_outlined,
                                  size: 18),
                              const SizedBox(width: 8),
                              networkImage(
                                  viewModel.loginService.UserData.profile,
                                  20,
                                  20,
                                  true),
                              // CircleAvatar(
                              //   radius: 15,
                              //   backgroundColor: Colors.black,
                              //   backgroundImage: NetworkImage(viewModel
                              //       .loginService.UserData.profile
                              //       .toString()),
                              // ),
                              const SizedBox(width: 4),
                              ButtonText(
                                  text: viewModel
                                          .loginService.UserData.username ??
                                      "",
                                  color: Colors.black),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          )
                        ],
                      ),
                    ),
                    Center(child: viewModel.pages[viewModel.pageNo]),
                  ],
                ))
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
