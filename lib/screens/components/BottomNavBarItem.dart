import 'package:flutter/material.dart';


class BottomNavBarItem extends StatelessWidget {

  bool isActive;
  IconData icon;
  
  BottomNavBarItem({
    Key key,
    this.isActive =false,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical:20.0), 
        child: Icon(
          icon,
          color: isActive?Theme.of(context).primaryColor:Colors.black,
        ),
      ),
    );
  }
}