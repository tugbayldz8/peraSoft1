import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../product/theme/custom_color_scheme.dart';
import '../../../product/utils/string_constants.dart';

class BottomNavBuilder extends StatefulWidget {
  const BottomNavBuilder({super.key});

  @override
  State<BottomNavBuilder> createState() => _BottomNavBuilderState();
}

int currentIndex = 0;

class _BottomNavBuilderState extends State<BottomNavBuilder> {
 
  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/home_page');
        break;
      case 1:
        context.go('/category_page');
        break;
      default:
        context.go('/top_list_page');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: CustomColorScheme.appBarBackground,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.list),
          label: StringConstants.list,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.category),
          label: StringConstants.category2,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.star),
          label: StringConstants.topList,
        ),
      ],
      currentIndex: currentIndex,
      onTap: changeTab,
    );
  }
}
