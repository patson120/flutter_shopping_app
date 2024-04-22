

import 'dart:convert';

class Product{

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
    });

  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final double? discountPercentage;
  final dynamic rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<dynamic>? images;

  factory Product.fromJson(String string) => Product.fromMap(json.decode(string));

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json['id'] ?? 0,
    title: json['title'] ?? "",
    description: json['description'] ?? "",
    price: json['price'] ?? 0,
    discountPercentage: json['discountPercentage'] ?? 0.0,
    rating: json['rating'] ?? 0.0,
    stock: json['stock'] ?? 0,
    brand: json['brand'] ?? "",
    category: json['category'] ?? "",
    thumbnail: json['thumbnail'] ?? "",
    images: json['images'] ?? [],
  );

  Map<String, dynamic> toMap() => {
    'id': id ?? "",
    'title': title ?? "",
    'description': description ?? "",
    'price': price ?? 0,
    'discountPercentage': discountPercentage ?? 0.0,
    'rating': rating ?? 0.0,
    'stock': stock ?? 0,
    'brand': brand ?? "",
    'category': category ?? "",
    'thumbnail': thumbnail ?? '',
    'images': images ?? [],
  };
  
  String toJson() => json.encode(toMap());
}