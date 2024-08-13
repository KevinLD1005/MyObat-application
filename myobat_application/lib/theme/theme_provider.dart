import 'package:flutter/material.dart';
import 'package:myobat_application/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  void toggleTheme(bool isDarkMode) {
    _themeData = isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }
}

// class ThemeProvider with ChangeNotifier {
//   ThemeData _themeData = lightMode;

//   ThemeData get themeData => _themeData;

//   set themeData(ThemeData themeData) {
//     _themeData = themeData;
//     notifyListeners();
//   }

//   void toggleTheme() {
//     if (_themeData == lightMode) {
//       themeData = darkMode;
//     } else {
//       themeData = lightMode;
//     }
//   }
// }

