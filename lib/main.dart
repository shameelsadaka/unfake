import 'package:flutter/material.dart';

import 'theme.dart';
import 'router.dart';

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
      initialRoute: '/home',
      onGenerateRoute: generateRoute,
    );
  }
}
