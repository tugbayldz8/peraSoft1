import 'package:flutter/material.dart';

class SelectCategoryProvider extends ChangeNotifier {
  String? selectedCategory;

  void selectCategory(String category) {
    selectedCategory = category;
   
    notifyListeners();
  }
}
