import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../../feature/home/data/models/product/product_model.dart';

class CacheManager {
  CacheManager._();

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
    Hive();
    Hive.registerAdapter(
        'products', ((json) => Product.fromJson(json as Map<String, dynamic>)));
  }

  static void setProducts(List<Product> products) {
    final box = Hive.box<Product>(name: 'Product');
    for (var i = 0; i < products.length; i++) {
      box.add(products[i]);
    }
  }

  static List<Product>? getProducts() {
    final box = Hive.box<Product>(name: 'Product');
    List<Product> products = [];
    for (var i = 0; i < box.length; i++) {
      final product = box.getAt(i);
      products.add(product);
    }
    return products;
  }

  static void clearList() {
    final box = Hive.box<Product>(name: 'Product');
    box.clear();
  }
}
