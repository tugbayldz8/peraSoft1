import '../../../feature/home/data/models/product/product_model.dart';

class FetchCategories {
  FetchCategories._();
  static List<String> fetchCategories(List<Product> products) {
    List<String> categoryNames = [];
    for (var product in products) {
      if (product.category == null) {
        continue;
      } else if(categoryNames.contains(product.category!)){
        continue;
      }
      categoryNames.add(product.category!);
    }
    return categoryNames;
  }
}
