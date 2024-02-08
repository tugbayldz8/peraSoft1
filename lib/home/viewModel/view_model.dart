import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageViewModel extends ChangeNotifier {
  List<dynamic> categories = [];
  List<dynamic> topProducts = [];
  List<dynamic> images = [];
  List<dynamic> products = [];
 
   HomePageViewModel() {
    fetchCategories();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      products = List<dynamic>.from(data);
      notifyListeners();
    } else {
      print('Hata kodu: ${response.statusCode}');
    }
  }

  Future<void> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
        categories = List<String>.from(data);
     notifyListeners();
      await fetchTopProducts();
    } else {
      print('Hata kodu: ${response.statusCode}');
    }
  }

  Future<void> fetchTopProducts() async {
    for (String category in categories) {
      final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products/category/$category'));

      if (response.statusCode == 200) {
        List<dynamic> products = json.decode(response.body);
        if (products.isNotEmpty) {
          products.sort((a, b) => b['price'].compareTo(a['price']));
          topProducts.add(products.first);
           notifyListeners();
        }
      } else {
        print('Hata kodu: ${response.statusCode}');
      }
    }
  }
}
