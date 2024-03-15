import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../product/utils/string_constants.dart';
import '../../../../product/widget/custom_list_view_builder_widget.dart';
import '../../../home/data/models/product/product_model.dart';
import '../../../home/viewModel/view_model.dart';

final class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: Provider.of<HomePageViewModel>(context).fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
              child:
                  Text('${StringConstants.hataolustu}+ ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          List<Product> sortedProducts = snapshot.data!;
          sortedProducts.sort((a, b) => b.price.compareTo(a.price));
          return CustomListViewBuilderWidget(sortedProducts: sortedProducts);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}