import 'package:flutter/material.dart';

class LandingViewModel extends ChangeNotifier {
  bool _isLandig = true;
  bool get isLanding => _isLandig;
  
  Future<void> navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 2));
    _isLandig = false;
    notifyListeners();
  }
}
