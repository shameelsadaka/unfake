import 'package:flutter/material.dart';



// Components
import 'BottomNavBarItem.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key key,
  }) : super(key: key);

  

  final List<BottomItem> bottomIcons = [
    BottomItem('/home',Icons.home),
    BottomItem('/myposts',Icons.speaker_notes),
    BottomItem('/saved_posts',Icons.bookmark),
    BottomItem('/settings',Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomIcons.map((item){
          return BottomNavBarItem(icon:item.icon,isActive: ModalRoute.of(context).settings.name == item.routeName);
        }).toList(),
      ),
    );
  }
}


class BottomItem{
  String routeName;
  IconData icon;

  BottomItem(this.routeName,this.icon);
}
