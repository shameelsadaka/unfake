import 'package:flutter/material.dart';


import 'AppLayout.dart';


import 'screens/HomePage.dart';
import 'screens/LoginPage.dart';
import 'screens/PostViewPage.dart';
import 'screens/SetupProfilePage.dart';
import 'screens/ProfilePage.dart';
import 'screens/SavedPostsPage.dart';
import 'screens/NewPostPage.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:HomePage()),settings: settings);
    case '/login':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:LoginPage()),settings: settings);
    case '/post':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:PostViewPage(cardData:settings.arguments)),settings: settings);
    case '/setup_profile':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:SetupProfilePage()),settings: settings);
    case '/profile':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:ProfilePage()),settings: settings);
    case '/new_post':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:NewPostPage()),settings: settings);
    case '/saved_posts':
      return MaterialPageRoute(builder: (context)=>AppLayout(body:SavedPostsPage()),settings: settings);
    default:
      return MaterialPageRoute(builder: (context) => AppLayout(body:Center(child: Text('Page Not Found'))),settings: settings);
  }
}