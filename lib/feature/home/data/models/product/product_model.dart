import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final String? category;
  final String? image;
  const Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.category,
    this.image,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      category: json['category'] ?? '',
      image: json['image'] ?? '',
    );
  }
  factory Product.fromJsonDynamic(dynamic json) => Product.fromJson(json);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
    };
  }


  @override
  List<Object?> get props => [id, title, description, price, category, image];
}
