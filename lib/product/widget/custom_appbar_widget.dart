import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/custom_color_scheme.dart';
import '../theme/notifier/theme_notifier.dart';

final class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.appBarTitle,
  });

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColorScheme.appBarBackground,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(appBarTitle),
          IconButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
            icon: context.watch<ThemeNotifier>().isLightTheme
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
