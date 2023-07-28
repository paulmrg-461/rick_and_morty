import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode;
  ThemeProvider({required this.isDarkMode});

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: const Color(0xff08B3CB),
        // colorSchemeSeed: const Color(0xff006387),
      );
}
