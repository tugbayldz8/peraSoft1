 import 'package:flutter/material.dart';

IconData categoryIcon(int index) {
    switch (index) {
      case 0:
        return Icons.laptop_chromebook_outlined;
      case 1:
        return Icons.ac_unit_sharp;
      case 2:
        return Icons.man;
      case 3:
        return Icons.woman;
      default:
        return Icons.home;
    }
  }