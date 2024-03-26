import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/provider/select_category_provider.dart';
import 'package:pera_soft1/feature/home/viewModel/view_model.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../product/theme/custom_color_scheme.dart';
import '../../../../product/utils/function/category_icon.dart';
import '../../data/models/product/product_model.dart';
import '../../data/repositories/services/product/product_service.dart';

final class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({
    super.key,
    required this.categoryNames,
  });

  final List<Product> categoryNames;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryExtension(context).veryhighValue2x / 1.30,
      child: Consumer<SelectCategoryProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryNames.length,
            itemBuilder: (context, index) {
              Product product = categoryNames[index];
              bool isSelectedIcon =
                  product.category == provider.selectedCategory;
              return InkWell(
                onTap: () {
                  provider.selectCategory(product.category);
                 
                },
                child: Padding(
                  padding: context.paddingAllDefault / 1.3,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: isSelectedIcon
                              ? CustomColorScheme.customButtonColor
                              : CustomColorScheme.textColorwhite,
                          radius: 30,
                          child: Icon(
                            color: isSelectedIcon
                                ? CustomColorScheme.textColorwhite
                                : CustomColorScheme.customBottomNavColor
                                    .withOpacity(0.4),
                            categoryIcon(index),
                            size: context.defaultValue * 2.5,
                          ),
                        ),
                      ),
                      SizedBox(height: context.lowValue),
                      Text(
                        product.category,
                        style: TextStyle(
                          color: isSelectedIcon
                              ? CustomColorScheme.customButtonColor
                              : CustomColorScheme.customBottomNavColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
