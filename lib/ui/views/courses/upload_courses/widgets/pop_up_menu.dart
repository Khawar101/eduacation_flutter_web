import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:flutter/material.dart';
enum SampleItem { itemOne, itemTwo }
class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 30,
      child: PopupMenuButton<SampleItem>(
        padding: const EdgeInsets.all(0),
        iconSize: 15,position: PopupMenuPosition.over,
        initialValue: selectedMenu,
       
        // Callback that sets the selected popup menu item.
        onSelected: (SampleItem item) {
          setState(() {
            selectedMenu = item;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          const PopupMenuItem<SampleItem>(
               padding: EdgeInsets.all(0),
            value: SampleItem.itemOne,
            child: SmallText(text: "remove", color: Colors.red)
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            padding: EdgeInsets.all(0),
             child: SmallText(text: "add", color: Colors.black)
          ),
        
        ],
      ),
    );
  }
}