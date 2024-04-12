import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/viewModel/home_view_model.dart';
import 'package:pera_soft1/product/base/widget/product_list_view_builder.dart';
import 'package:provider/provider.dart';
import '../../../home/data/models/product/product_model.dart';
import '../../../home/data/repositories/services/product/product_service.dart';

final class FutureBuilderWidget extends StatelessWidget {
  FutureBuilderWidget({
    super.key,
  });
  final productService = ProductService();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, snapshot, child) {
        if (snapshot.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        List<Product> sortedProducts = List.from(snapshot.products);
        sortedProducts.sort((a, b) {
          if (a.price == null || b.price == null) return 0;
          return b.price!.compareTo(a.price!);
        });
        return ProductListViewBuilder(sortedProducts: sortedProducts);
      },
    );
  }
}
