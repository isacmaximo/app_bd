// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final int code;
  final String name;
  final double price;
  final String category;
  Product({
    required this.code,
    required this.name,
    required this.price,
    required this.category,
  });

  Product copyWith({
    int? code,
    String? name,
    double? price,
    String? category,
  }) {
    return Product(
      code: code ?? this.code,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'price': price,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      code: map['code'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(code: $code, name: $name, price: $price, category: $category)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.name == name &&
        other.price == price &&
        other.category == category;
  }

  @override
  int get hashCode {
    return code.hashCode ^ name.hashCode ^ price.hashCode ^ category.hashCode;
  }
}
