import 'package:flutter/material.dart';
import '../theme/custom_color_scheme.dart';

final class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key, required this.appBarTitle,
  });

final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColorScheme.appBarBackground,
      title: Center(
        child: Text(appBarTitle),
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
