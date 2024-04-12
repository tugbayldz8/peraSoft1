import 'package:flutter/material.dart';
import '../widget/bottom_nav_builder_widget.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const BottomNavBuilder(),
    );
  }
}
