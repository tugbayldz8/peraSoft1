import 'package:flutter/material.dart';
import '../../../product/theme/custom_color_scheme.dart';
import '../../../product/utils/string_constants.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required ValueNotifier<int> selectedIndexNotifier,
  }) : _selectedIndexNotifier = selectedIndexNotifier;

  final ValueNotifier<int> _selectedIndexNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndexNotifier,
      builder: (context, selectedIndex, _) {
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
          currentIndex: selectedIndex,
          onTap: (index) {
            _selectedIndexNotifier.value = index;
           
          },
        );
      },
    );
  }
}
