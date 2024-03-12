import 'package:flutter/material.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import '../../../../product/utils/string_constants.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';

final class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColorScheme.firstAppbarColor,
      width: MediaQueryExtension(context).veryhighValue4x,
      child: Center(
          child: Text(
        StringConstants.enPahaliUrunler,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      )),
    );
  }
}
