import 'package:flutter/material.dart';

final class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = true;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return isLightTheme
        ? ThemeData.light()
        // .copyWith(iconTheme: IconThemeData(color: Colors.green))
        : ThemeData.dark();
    // .copyWith(iconTheme: IconThemeData(color: Colors.red),);
  }
}
