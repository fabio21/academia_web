import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  cardColor: Colors.blueGrey[50],
  dividerColor: Colors.blueGrey[900],
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    titleSmall: TextStyle(
      color: Colors.blueGrey[900],
    ),
    titleMedium: TextStyle(
      color: Colors.black,
    ),
    displayLarge: TextStyle(color: Colors.blueGrey[800]),
    displayMedium: TextStyle(color: Colors.blueGrey[800], fontSize: 18),
  ),
  iconTheme: IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.light,
  ).copyWith(
    background: Colors.white,
    primary: Colors.white,
    primaryContainer: Colors.white,
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.blueGrey[900]),
);

var darkThemeData = ThemeData(
  cardColor: Colors.black,
  dividerColor: Colors.blueGrey[200],
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    titleSmall: TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      color: Colors.blueGrey[300],
    ),
    displayLarge: TextStyle(
      color: Colors.white70,
    ),
    displayMedium: TextStyle(
      color: Colors.white70,
      fontSize: 18,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
  ).copyWith(
    background: Colors.blueGrey[900],
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
);
