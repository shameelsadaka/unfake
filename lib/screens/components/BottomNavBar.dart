import 'package:flutter/material.dart';



// Components
class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key key,
  }) : super(key: key);

  

  final List<BottomNavItem> bottomIcons = [
    BottomNavItem('/home',Icons.home),
    BottomNavItem('/myposts',Icons.speaker_notes),
    null,
    BottomNavItem('/saved_posts',Icons.bookmark),
    BottomNavItem('/settings',Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomIcons.map((item){
          return item == null?new SizedBox(width: 50):BottomNavBarItemUI(icon:item.icon,isActive: ModalRoute.of(context).settings.name == item.routeName);
        }).toList(),
      ),
    );
  }
}


class BottomNavItem{
  String routeName;
  IconData icon;

  BottomNavItem(this.routeName,this.icon);
}




class BottomNavBarItemUI extends StatelessWidget {

  bool isActive;
  IconData icon;
  
  BottomNavBarItemUI({
    Key key,
    this.isActive =false,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0,vertical:20.0), 
        child: Icon(
          icon,
          color: isActive?Theme.of(context).primaryColor:Colors.black,
        ),
      ),
    );
  }
}