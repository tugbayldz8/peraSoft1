import 'package:get_it/get_it.dart';
import 'package:pera_soft1/feature/home/data/repositories/services/product/product_service.dart';
import 'package:pera_soft1/product/database/hive/core/cache_manager.dart';
import 'package:pera_soft1/product/utils/service/service_manager.dart';

abstract final class Locator {
  static final _getIt = GetIt.instance;

  static void setUp() {
    _getIt
      ..registerSingleton(CacheManager.instance)
      ..registerFactory(() => ProductService(serviceManager: _getIt()))
      ..registerFactory(() => ServiceManager.instance);
  }

  static T read<T extends Object>() => _getIt.get<T>();
}
