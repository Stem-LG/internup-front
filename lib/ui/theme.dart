import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.black,
  colorScheme: const ColorScheme.light(primary: Colors.black),
  fontFamily: "Flama",
  textTheme: const TextTheme(bodyMedium: TextStyle(letterSpacing: 1), bodySmall: TextStyle(letterSpacing: 1), bodyLarge: TextStyle(letterSpacing: 1)),
  //set letterspacing to 1 for all text
  appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(fontFamily: "Flama", color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.4),
      centerTitle: true),
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.black),
);
