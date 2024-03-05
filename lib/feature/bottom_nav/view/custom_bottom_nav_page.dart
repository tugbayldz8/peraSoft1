import 'package:flutter/material.dart';
import '../widget/bottom_nav_widget.dart';
import '../widget/get_page_widget.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({super.key});
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (context, selectedIndex, _) {
          return  buildGetPage(selectedIndex);
        },
      ),
      bottomNavigationBar: BottomNav(
        selectedIndexNotifier: _selectedIndexNotifier,
      ),
    );
  }
}
