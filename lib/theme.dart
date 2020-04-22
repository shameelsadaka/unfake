import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

ThemeData getThemeData() {
  return ThemeData(
    // Define the default brightness and colors.
    primaryColor: Color(0xFF10C971),
    // accentColor: Colors.cyan[600],

    backgroundColor: Colors.grey[50],


    // fontFamily: 'Georgia',

    // textTheme: TextTheme(
    //   headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    //   title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    //   body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // ),
  );
}
class LoginColors{
const LoginColors();

static const Color loginGradientStart = const Color(0xFFfbab66);
static const Color loginGradientEnd = const Color(0xFFf7418c);

static const primaryGradient = const LinearGradient(
colors: const [loginGradientStart, loginGradientEnd],
stops: const [0.0, 1.0],
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
);
}