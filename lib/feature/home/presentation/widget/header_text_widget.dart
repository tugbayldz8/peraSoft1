import 'package:flutter/material.dart';
import '../../../../product/theme/custom_color_scheme.dart';

final class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    super.key, required this.headerLeft, required this.headerRight,
  });
  final String headerLeft;
  final String headerRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         headerLeft,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: CustomColorScheme.customBottomNavColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          headerRight,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 15, color: CustomColorScheme.customButtonColor),
        ),
      ],
    );
  }
}
