import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  // brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.black87,
      onBackground: Colors.white,
      primary: Colors.grey.shade300,
      secondary: Colors.black),
);

ThemeData darkMode = ThemeData(
  // brightness: Brightness.dark,
  colorScheme: ColorScheme.light(
      background: Colors.black87,
      onBackground: Colors.black,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade300),
);
