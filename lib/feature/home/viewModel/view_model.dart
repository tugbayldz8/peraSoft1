import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import '../data/models/product/product_model.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel({required this.productService});

  final ProductService productService;

  Future<List<Product>> fetchProducts() async {
    return await productService.fetchProducts();
  }

  List<Product> getMostExpensiveProductsPerCategory(List<Product> products) {
    Map<String, Product> mostExpensiveProductsMap = {};

    for (Product product in products) {
      String category = product.category;
      if (mostExpensiveProductsMap.containsKey(category)) {
        Product existingProduct = mostExpensiveProductsMap[category]!;
        if (product.price > existingProduct.price) {
          mostExpensiveProductsMap[category] = product;
        }
      } else {
        mostExpensiveProductsMap[category] = product;
      }
    }

    return mostExpensiveProductsMap.values.toList();
  }

  List<Product> fetchCategories(List<Product> products) {
     Map<String,Product> categoryNames = {};
      for (var product in products) {
        String categoryName = product.category;
        categoryNames[categoryName] = product;
      }
    return categoryNames.values.toList();
  }
}
