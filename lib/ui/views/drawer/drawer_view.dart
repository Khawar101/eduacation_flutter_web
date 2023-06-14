import 'package:education_flutter_web/ui/common/app_assets.dart';
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
                      height: 80,
                      child: DrawerHeader(
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.fromLTRB(0, 16, 4, 0),
                        child: ListTile(
                          leading: Image.asset(
                            logo,
                            width: 40,
                          ),
                          title: const CustomText(
                            text: "Education App",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.home_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Home'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                         viewModel.       updatePage(0);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_box,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Account'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                         viewModel.       updatePage(1);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.contacts_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Contacts'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                         viewModel.       updatePage(2);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.groups_2_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Teachers'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                         viewModel.       updatePage(3);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.book_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Courses'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                         viewModel.       updatePage(4);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.menu_book,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('E-Book'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                 viewModel.           updatePage(5);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.keyboard_command_key_rounded,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('E-Learning'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                         viewModel.       updatePage(6);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings_outlined,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Settings'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                         viewModel.       updatePage(7);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      title: const Text('Logout'),
                      minLeadingWidth: 0.009,
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(

                    color: Colors.red.withOpacity(0.2),
                    child: Center(child:viewModel. pages[viewModel.pageNo])))
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
