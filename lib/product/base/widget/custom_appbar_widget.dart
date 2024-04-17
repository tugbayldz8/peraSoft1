import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pera_soft1/product/theme/bloc/theme_bloc.dart';
import '../../theme/custom_color_scheme.dart';

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
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (state.themeData == ThemeData.light()) {
                    context
                        .read<ThemeBloc>()
                        .add(const ChangeThemeEvent(false));
                  } else {
                    context.read<ThemeBloc>().add(const ChangeThemeEvent(true));
                  }
                },
                icon: state.themeData == ThemeData.dark()
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
