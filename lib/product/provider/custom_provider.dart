import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../feature/home/data/models/product/product_model.dart';
import '../../feature/home/viewModel/view_model.dart';

abstract class CustomProvider {
  Future<List<Product>> fetchProducts(BuildContext context);
}

final class HomePageViewModelProvider implements CustomProvider {
  @override
  Future<List<Product>> fetchProducts(BuildContext context) async {
    return Provider.of<HomePageViewModel>(context, listen: false)
        .fetchProducts();
  }

}
