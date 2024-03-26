import 'package:flutter/material.dart';

final class DropdownProvider extends ChangeNotifier {
  String _selectedItem = 'Zihuatanejo, Gro';
  final List<String> _items = [
    'Zihuatanejo, Gro',
    'Item 2',
    'Item 3',
    'Item 4'
  ];

  String get selectedItem => _selectedItem;
  List<String> get items => _items;
  void setSelectedItem(String newValue) {
    _selectedItem = newValue;
    notifyListeners();
  }
}
