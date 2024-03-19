import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pera_soft1/product/utils/string/string_constants.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';

final class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.go("/home_page");
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: CustomColorScheme.appBarBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        side:
            const BorderSide(color: CustomColorScheme.circleHover, width: 2.0),
      ),
      child: Padding(
        padding: PaddingExtension(context).paddingAllDefault,
        child: Text(
          StringConstants.hemenBasla,
        ),
      ),
    );
  }
}
