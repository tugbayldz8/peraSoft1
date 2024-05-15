import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import 'package:pera_soft1/product/database/hive/core/cache_manager.dart';
import 'package:pera_soft1/product/firebase/service/firebase_auth_service.dart';
import 'package:pera_soft1/product/state/container/product_state_container.dart';
import 'package:pera_soft1/product/utils/service/service_manager.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static CacheManager get cacheManager => Locator.read<CacheManager>();
  static ProductService get productService => Locator.read<ProductService>();
  static ServiceManager get serviceManager => Locator.read<ServiceManager>();
  static FirebaseAuthService get firebaseAuth =>
      Locator.read<FirebaseAuthService>();
}
