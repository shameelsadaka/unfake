import 'package:flutter/material.dart';

import 'theme.dart';
import 'AppLayout.dart';


import 'screens/HomePage.dart';
import 'screens/LoginPage.dart';
import 'screens/SignUpPage.dart';


void main() {
  runApp(ItsTrueApp());
}


class ItsTrueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'ItsTrue';
    return MaterialApp(
      title: appName,
      theme: getThemeData(), // Theme Data is Set in theme.dart
      initialRoute: '/signup',
      routes: {
        '/home':(context)=>AppLayout(body:HomePage()),
        '/login':(context)=>AppLayout(body:LoginPage()),
        '/signup':(context)=>AppLayout(body:SignUpPage()),
      },
    );
  }
}
