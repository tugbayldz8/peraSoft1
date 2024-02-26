import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/models/product/product_model.dart';


class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel() {}

  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> deneme =
          data.map((item) => Product.fromJson(item)).toList();
      return deneme;
    } else {
      throw Exception('Bir hata oluştu');
    }
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
}
