import '../../../feature/home/data/models/product/product_model.dart';

class FetchCategories {
  FetchCategories._();
  static List<Product> fetchCategories(List<Product> products) {
    Map<String, Product> categoryNames = {};
    for (var product in products) {
      String categoryName = product.category ?? '';
      categoryNames[categoryName] = product;
    }
    return categoryNames.values.toList();
  }
}
