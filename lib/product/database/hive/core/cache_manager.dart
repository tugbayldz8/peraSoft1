import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pera_soft1/product/database/hive/constants/cache_enums.dart';
import 'package:pera_soft1/product/database/hive/constants/hive_database_constants.dart';
import '../../../../feature/home/data/models/product/product_model.dart';

final class CacheManager {
  CacheManager._();
  static final _instance = CacheManager._();
  static CacheManager get instance => _instance;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
    Hive.registerAdapter(HiveDatabaseConstants.userModelBox,
        ((json) => Product.fromJson(json as Map<String, dynamic>)));
  }

  void setDataList<T>(List<T> products, BoxName name) {
    final box = Hive.box<T>(name: name.value);
    for (var i = 0; i < products.length; i++) {
      box.add(products[i]);
    }
  }

  void setData<T>(T data, BoxName name) {
    final box = Hive.box<T>(name: name.value);
    box.add(data);
  }

  List<T> getDataList<T>(BoxName name) {
    final box = Hive.box<T>(name: name.value);
    List<T> products = [];
    for (var i = 0; i < box.length; i++) {
      final product = box.getAt(i);
      products.add(product);
    }
    return products;
  }

  T? getData<T>(BoxName name) {
    final box = Hive.box<T>(name: name.value);
    final data = box.get(name.value);
    if (data == null) return null;
    return data;
  }

  void clearList<T>(BoxName name) {
    final box = Hive.box<T>(name: name.value);
    box.clear();
  }
}
