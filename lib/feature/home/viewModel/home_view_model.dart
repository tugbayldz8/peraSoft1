import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import 'package:pera_soft1/product/utils/categories/fetch_category.dart';
import '../data/models/product/product_model.dart';

class HomeViewModel with ChangeNotifier {
  String? _error;
   String? _selectedCategory;
   List<String> _categories = [];
  List<Product> _products = [];
  final _productService = ProductService();
  List<Product>? _cachedProduct;  

  List<Product> get products => _products;
  List<Product>? get cachedProduct => _cachedProduct;
  String? get error => _error; 
  String? get selectedCategory => _selectedCategory;
  List<String> get categories => _categories;

  Future<void> setProducts() async {
    final response = await _productService.fetchProducts<List<Product>>();
    if (response.error != null) {
      _error = response.error;
    } else {
      _products = response.data!;
      _categories = FetchCategories.fetchCategories(response.data!);
    }
    notifyListeners(); 
  }

   void selectCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

 
}
