import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import '../../../product/theme/custom_color_scheme.dart';
import '../mixin/bottom_nav_mixin.dart';

class BottomNavBuilder extends StatefulWidget {
  const BottomNavBuilder({super.key});

  @override
  State<BottomNavBuilder> createState() => _BottomNavBuilderState();
}

class _BottomNavBuilderState extends State<BottomNavBuilder>
    with BottomNavigationBarMixin {
  // bool isSelected = false;
  // void selectedChange() {
  //   setState(() {
  //     isSelected = !isSelected;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: BottomNavigationBar(
          backgroundColor: CustomColorScheme.customBottomNavColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color.fromARGB(255, 163, 162, 162),
          fixedColor: CustomColorScheme.textColorwhite,
          items: bottomNavigationBarItemList(),
          currentIndex: currentIndex,
          onTap: (index) {
            changeTab(index, context);
          }),
    );
    // return Container(
    //   height: 60,
    //   decoration: BoxDecoration(
    //     color: CustomColorScheme.customBottomNavColor,
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(25),
    //       topRight: Radius.circular(25),
    //     ),
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           selectedChange();
    //         },
    //         child: isSelected
    //             ? Row(
    //                 children: [
    //                   Icon(
    //                     Icons.circle,
    //                     size: 10,
    //                     color: CustomColorScheme.textColorwhite,
    //                   ),
    //                   SizedBox(width: context.defaultValue * 0.5),
    //                   Text(
    //                     'Home',
    //                     style: context.textTheme.bodyMedium?.copyWith(
    //                       color: CustomColorScheme.textColorwhite,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ],
    //               )
    //             : Icon(
    //                 Icons.home,
    //                 color: CustomColorScheme.textColorwhite,
    //               ),
    //       ),
    //       Row(
    //         children: [
    //           Icon(Icons.face),
    //           Text('face'),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
