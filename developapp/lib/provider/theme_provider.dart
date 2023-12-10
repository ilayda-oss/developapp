import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  Color get textfieldColor => isDarkMode
      ? Color.fromARGB(255, 183, 129, 255)
      : Color.fromARGB(255, 248, 186, 186);
  Color get primaryColor => Color(0xFFF66DA7);
  Color get appBarColor => isDarkMode ? Color(0xFFF66DA7) : Color(0xFFF66DA7);
  Color get bodyColor => isDarkMode ? Color(0xFF57209D) : Color(0xFFFDE456);
  Color get assetColor => isDarkMode ? Color(0xFFFDE456) : Color(0xFF57209D);
  Color get switchButtonColor =>
      isDarkMode ? Color(0xFF57209D) : Color(0xFFFDE456);
  String get switchImage =>
      isDarkMode ? 'lib/images/dark.png' : 'lib/images/light.png';

  Color get textColor => isDarkMode ? Color(0xFFFDE456) : Color(0xFFFDE456);
  Color get buttonColor =>
      isDarkMode ? const Color(0xFF57209D) : Color(0xFFFDE456);
  String get switchImages =>
      isDarkMode ? 'lib/images/kiz.png' : 'lib/images/erkek.png';

  EdgeInsets get switchImagesMargin {
    return isDarkMode
        ? EdgeInsets.only(top: 177, right: 254)
        : EdgeInsets.only(top: 177, left: 287);
  }

  // Color.fromARGB(255, 228, 103, 176);
}
