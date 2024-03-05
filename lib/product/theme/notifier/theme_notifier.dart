import 'package:flutter/material.dart';

final class ThemeNotifier extends ChangeNotifier{
   ThemeData _currentThemeData = ThemeData.light(); 

  ThemeData get currentTheme => _currentThemeData; 

  void setTheme(ThemeData themeData) {
    _currentThemeData = themeData; 
    notifyListeners(); 
  }
}