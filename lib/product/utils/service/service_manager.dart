import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pera_soft1/product/base/model/base_response_model.dart';

final class ServiceManager {
  final String baseUrl = 'https://fakestoreapi.com/';

  Future<BaseResponseModel<T>> get<T>(String path) async {
    final response = await http.get(Uri.parse(baseUrl + path));
    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      return BaseResponseModel(data: data);
    } else {
      return BaseResponseModel(error: response.reasonPhrase);
    }
  }
}
