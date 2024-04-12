import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pera_soft1/product/constants/string/string_constants.dart';
import 'package:pera_soft1/product/router/router_paths.dart';
import '../widget/bottom_nav_builder_widget.dart';

mixin BottomNavigationBarMixin on State<BottomNavBuilder> {
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItemList() {
    return [
      buildNavigationBarItem(icon: Icons.home, index: 0),
      buildNavigationBarItem(icon: Icons.category, index: 1),
      buildNavigationBarItem(icon: Icons.list, index: 2),
    ];
  }

  String _labelText(int index) {
    if (index == 0) {
      return StringConstants.home;
    } else if (index == 1) {
      return StringConstants.list;
    } else {
      return StringConstants.topList;
    }
  }

  BottomNavigationBarItem buildNavigationBarItem({
    required IconData icon,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: _labelText(index),
    );
  }

  Future<void> changeTab(int index, BuildContext context) async {
    switch (index) {
      case 0:
        GoRouter.of(context).go(RouterPaths.home.path);
        break;
      case 1:
        GoRouter.of(context).go(RouterPaths.list.path);
        break;
      default:
        GoRouter.of(context).go(RouterPaths.topList.path);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }
}
