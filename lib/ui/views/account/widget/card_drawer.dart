import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Scaffold(
        body: Container(
          height: 10,
          width: 100,
          color: Colors.red,
        ),
        endDrawer: Drawer( backgroundColor: Colors.black,),
      ),
    );
  }
}
