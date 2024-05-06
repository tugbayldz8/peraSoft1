import 'package:pera_soft1/product/state/base/model/base_response_model.dart';
import '../../../../../../product/utils/service/service_manager.dart';
import '../../../models/product/product_model.dart';

final class ProductService {
  ProductService({required ServiceManager serviceManager})
      : _serviceManager = serviceManager;
  final ServiceManager _serviceManager;
  Future<BaseResponseModel<T>> fetchProducts<T>() async {
    final response = await _serviceManager.get<dynamic>('products');
    if (response.error != null) {
      return response as BaseResponseModel<T>;
    } else if (response.data is List) {
      final data = response.data
          .map((item) => Product.fromJson(item))
          .cast<Product>()
          .toList();
      return BaseResponseModel<T>(data: data);
    } else {
      return BaseResponseModel(error: 'Data is not a list');
    }
  }

  Future<BaseResponseModel<T>> fetchCategories<T>() async {
    final response = await _serviceManager.get<dynamic>('products/categories');
    if (response.error != null) {
      return BaseResponseModel<T>(error: response.error);
    } else if (response.data is List) {
      final data =
          response.data.map((item) => item.toString()).cast<String>().toList();
      return BaseResponseModel<T>(data: data);
    } else {
      return BaseResponseModel(error: 'There is error while fetch categories');
    }
  }
}
