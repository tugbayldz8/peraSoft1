import 'package:json_annotation/json_annotation.dart';
import 'package:pera_soft1/product/state/base/model/base_model.dart';
part 'product_model.g.dart';

@JsonSerializable()
final class Product extends BaseModel<Product> {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final String? category;
  final String? image;
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.category,
    this.image,
  });
  factory Product.empty() => Product(
        id: 0,
        title: '',
        description: '',
        price: 0.0,
        category: '',
        image: '',
      );
  @override
  Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [id, title, description, price, category, image];
}
