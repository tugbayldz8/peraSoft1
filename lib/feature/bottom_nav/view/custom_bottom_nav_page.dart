import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pera_soft1/feature/category/presentation/view/category_page.dart';
import 'package:pera_soft1/feature/topList/presentation/view/topl_list_page.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import '../../../product/theme/custom_color_scheme.dart';
import '../../../product/utils/string/string_constants.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key, required this.child});
  final Widget child;

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItemList() {
    return [
      buildNavigationBarItem(icon: Icons.access_alarms_sharp, index: 0),
      buildNavigationBarItem(icon: Icons.category, index: 1),
      buildNavigationBarItem(icon: Icons.list, index: 2),
    ];
  }

  String _labelText(int index) {
    if (index == 0) {
      return StringConstants.list;
    } else if (index == 1) {
      return StringConstants.category;
    } else {
      return StringConstants.topList;
    }
  }

  BottomNavigationBarItem buildNavigationBarItem({
    required IconData icon,
    required int index,
  }) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: context.paddingAllLow,
          child: Icon(icon),
        ),
        label: _labelText(index));
  }

  // Future<void> changeTab(int index, BuildContext context) async {
  //   switch (index) {
  //     case 0:
  //       context.go('/home_page');
  //       break;
  //     case 1:
  //       context.go('/category_page');
  //       break;
  //     default:
  //       context.go('/top_list_page');
  //       break;
  //   }
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  static const List<Widget> _widgetOptions = <Widget>[
    CategoryPage(),
    TopListPage(),
    TopListPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: CustomColorScheme.appBarBackground,
          items: bottomNavigationBarItemList(),
          currentIndex: currentIndex,
          onTap: _onItemTapped
          // (index) { changeTab(index, context);},
          ),
    );
  }
}
