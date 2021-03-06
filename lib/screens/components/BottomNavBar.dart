import 'package:flutter/material.dart';



// Components
class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key key,
  }) : super(key: key);

  

  final List<BottomNavItem> bottomIcons = [
    BottomNavItem('Home','/home',Icons.home),
    BottomNavItem('New Post','/new_post',Icons.add_box),
    BottomNavItem('Saved Posts','/saved_posts',Icons.bookmark),
    BottomNavItem('My Posts','/profile',Icons.mode_comment),
    BottomNavItem('Settings','/settings',Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomIcons.map((item){
          return Expanded(child: BottomNavBarItemUI(icon:item.icon,name:item.name,route:item.routeName,isActive: ModalRoute.of(context).settings.name == item.routeName));
        }).toList(),
      ),
    );
  }
}


class BottomNavItem{
  String routeName;
  IconData icon;
  String name;
  BottomNavItem(this.name,this.routeName,this.icon);
}




class BottomNavBarItemUI extends StatelessWidget {

  final bool isActive;
  final String route;
  final IconData icon;
  final String name;
  const BottomNavBarItemUI({
    Key key,
    this.name,
    this.isActive =false,
    this.icon,  
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: (){  
        if(!isActive){
          Navigator.of(context).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false); 
        }
      },
      padding: EdgeInsets.symmetric(horizontal: 0,vertical:15.0), 
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            size: 18,
            color: isActive?Theme.of(context).primaryColor:Colors.black,
          ),
          Text(name,style:TextStyle(fontSize: 9,color: isActive?Theme.of(context).primaryColor:Colors.black))
        ],
      ),
    );
  }
}