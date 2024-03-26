import 'package:flutter/material.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import '../../../../product/utils/string/string_constants.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';

final class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: context.highValue,
            width: context.veryhighValue4x,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColorScheme.textColorwhite,
            ),
            child: Row(
              children: [
                Padding(
                  padding: context.paddingAllLow,
                  child: const Icon(Icons.search,
                      color: CustomColorScheme.customButtonColor),
                ),
                Text(
                  StringConstants.search,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQueryExtension(context).lowValue,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            backgroundColor: CustomColorScheme.customButtonColor,
            radius: 20,
            child: Icon(
              color: CustomColorScheme.textColorwhite,
              Icons.qr_code,
            ),
          ),
        ),
      ],
    );
  }
}
