import 'package:pera_soft1/product/base/model/base_response_model.dart';
import '../../../../../../product/utils/service/service_manager.dart';
import '../../../models/product/product_model.dart';

final class ProductService {
  final _serviceManager = ServiceManager();
  Future<BaseResponseModel> fetchProducts() async {
    final response = await _serviceManager.get<dynamic>('products');
    if (response.data == null) {
      return response;
    }
    final data = response.data
        .map((item) => Product.fromJson(item))
        .cast<Product>()
        .toList();
    return BaseResponseModel<List<Product>>(data: data);
  }
}
