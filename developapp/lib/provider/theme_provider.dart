import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  Color get primaryColor => Color.fromARGB(255, 228, 103, 176);
  Color get appBarColor => Color.fromARGB(255, 228, 103, 176);
  Color get bodyColor => isDarkMode ? Color(0xFF57209D) : Color(0xFFFDE456);
  Color get assetColor => isDarkMode ? Color(0xFFFDE456) : Color(0xFF57209D);
  Color get switchButtonColor =>
      isDarkMode ? Color(0xFF57209D) : Color(0xFFFDE456);
  String get switchImage =>
      isDarkMode ? 'lib/images/dark.png' : 'lib/images/light.png';

  Color get textColor =>
      isDarkMode ? const Color(0xFF57209D) : Color(0xFFFDE456);
  Color get buttonColor =>
      isDarkMode ? const Color(0xFF57209D) : Color(0xFFFDE456);
}
