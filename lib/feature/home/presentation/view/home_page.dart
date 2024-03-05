import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/bottom_nav/view/custom_bottom_nav_page.dart';
import '../../../../product/utils/edge_insets_constants.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final constantsEdgeInsets = ConstantEdgeInsets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(),  
    );
  }
}
