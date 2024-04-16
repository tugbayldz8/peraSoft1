import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import '../data/models/product/product_model.dart';

class HomeViewModel with ChangeNotifier {
  String? _error;
   String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  List<Product> _products = [];
  final _productService = ProductService();
  List<Product>? _cachedProduct;  //Nerede kullanılıypr******************************************

  List<Product> get products => _products;
  List<Product>? get cachedProduct => _cachedProduct;
  String? get error => _error;

  Future<void> setProducts() async {
    final response = await _productService.fetchProducts();
    if (response.error != null) {
      _error = response.error;
    } else {
      _products = response.data;
    }
    notifyListeners(); 
  }

   void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
