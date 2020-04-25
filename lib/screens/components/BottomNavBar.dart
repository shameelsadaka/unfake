import 'package:flutter/material.dart';



// Components
class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key key,
  }) : super(key: key);

  

  final List<BottomNavItem> bottomIcons = [
    BottomNavItem('/home',Icons.home),
    BottomNavItem('/myposts',Icons.mode_comment),
    null,
    BottomNavItem('/saved_posts',Icons.bookmark),
    BottomNavItem('/settings',Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomIcons.map((item){
          return item == null?new SizedBox(width: 20):BottomNavBarItemUI(icon:item.icon,route:item.routeName,isActive: ModalRoute.of(context).settings.name == item.routeName);
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
  String route;
  IconData icon;
  
  BottomNavBarItemUI({
    Key key,
    this.isActive =false,
    this.icon,  
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        if(!isActive){
          Navigator.of(context).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false); 
        }
      },
      padding: EdgeInsets.symmetric(horizontal: 0,vertical:20.0), 
      icon: Icon(
        icon,
        color: isActive?Theme.of(context).primaryColor:Colors.black,
      ),
    );
  }
}