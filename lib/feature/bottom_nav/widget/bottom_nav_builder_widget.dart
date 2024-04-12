import 'package:flutter/material.dart';
import '../../../product/theme/custom_color_scheme.dart';
import '../mixin/bottom_nav_mixin.dart';

class BottomNavBuilder extends StatefulWidget {
  const BottomNavBuilder({super.key});

  @override
  State<BottomNavBuilder> createState() => _BottomNavBuilderState();
}

class _BottomNavBuilderState extends State<BottomNavBuilder>
    with BottomNavigationBarMixin {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: BottomNavigationBar(
          backgroundColor: CustomColorScheme.customBottomNavColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color.fromARGB(255, 163, 162, 162),
          fixedColor: CustomColorScheme.textColorwhite,
          items: bottomNavigationBarItemList(),
          currentIndex: currentIndex,
          onTap: (index) {
            changeTab(index, context);
          }),
    );
  }
}
