import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import '../../../home/data/models/product/product_model.dart';

final class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({
    super.key,
    required this.mostExpensiveProducts,
    required int currentPageIndex,
  }) : _currentPageIndex = currentPageIndex;

  final List<Product> mostExpensiveProducts;

  final int _currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mostExpensiveProducts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: PaddingExtension(context).paddingLeftLow,
            width: MediaQueryExtension(context).lowValue,
            height: MediaQueryExtension(context).lowValue,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPageIndex == index
                  ? CustomColorScheme.circleHover
                  : CustomColorScheme.circle,
            ),
          );
        });
  }
}
