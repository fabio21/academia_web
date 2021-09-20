import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.white,
  cardColor: Colors.blueGrey[50],
  dividerColor: Colors.blueGrey[900],
  primaryTextTheme: TextTheme(
      button: TextStyle(
        color: Colors.blueGrey,
        decorationColor: Colors.blueGrey[300],
      ),
      subtitle2: TextStyle(
        color: Colors.blueGrey[900],
      ),
      subtitle1: TextStyle(
        color: Colors.black,
      ),
      headline1: TextStyle(color: Colors.blueGrey[800]),
      headline2: TextStyle(color: Colors.blueGrey[800], fontSize: 18)),
  bottomAppBarColor: Colors.blueGrey[900],
  iconTheme: IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
);

var darkThemeData = ThemeData(
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.blueGrey[900],
  cardColor: Colors.black,
  dividerColor: Colors.blueGrey[200],
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle2: TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: TextStyle(
      color: Colors.white70,
    ),
    headline2: TextStyle(
      color: Colors.white70,
      fontSize: 18,
    ),

  ),
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  brightness: Brightness.dark,
);
