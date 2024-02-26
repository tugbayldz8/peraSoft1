import 'dart:convert';
import 'package:pera_soft1/product/utils/string_constants.dart';
import '../../models/product/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService{
   Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> deneme =
          data.map((item) => Product.fromJson(item)).toList();
      return deneme;
    } else {
      throw Exception(StringConstants.hataolustu);
    }
  }
}