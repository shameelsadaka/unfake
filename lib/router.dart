import 'package:flutter/material.dart';


import 'AppLayout.dart';


import 'screens/HomePage.dart';
import 'screens/LoginPage.dart';
import 'screens/PostViewPage.dart';
import 'screens/SetupProfilePage.dart';
import 'screens/ProfilePage.dart';
import 'screens/NewPostPage.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:HomePage()));
    case '/login':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:LoginPage()));
    case '/post':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:PostViewPage(cardData:settings.arguments)));
    case '/setup_profile':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:SetupProfilePage()));
    case '/profile':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:ProfilePage()));
    case '/new_post':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:NewPostPage(),newPostButton: false));
    default:
      return MaterialPageRoute(builder: (context) => AppLayout(body:Center(child: Text('Page Not Found'))));
  }
}