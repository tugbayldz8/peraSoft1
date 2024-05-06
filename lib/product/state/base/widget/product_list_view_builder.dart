import 'package:flutter/material.dart';
import '../../../../feature/home/data/models/product/product_model.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';

final class ProductListViewBuilder extends StatelessWidget {
  const ProductListViewBuilder({
    super.key,
    required this.sortedProducts,
  });

  final List<Product> sortedProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sortedProducts.length,
      itemBuilder: (context, index) {
        Product product = sortedProducts[index];
        return ListTile(
          leading: Image.network(
            product.image ?? '',
            width: context.veryhighValue1x,
            height: context.veryhighValue1x,
            fit: BoxFit.cover,
          ),
          title: Text(product.title ?? ''),
          subtitle: Text(product.category ?? ''),
          trailing: Text('\$${product.price}'),
        );
      },
    );
  }
}
