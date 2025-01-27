// To parse this JSON data, do
//
//     final productodels = productodelsFromJson(jsonString);

import 'dart:convert';

List<ProductModels> productodelsFromJson(String str) =>
    List<ProductModels>.from(
        json.decode(str).map((x) => ProductModels.fromJson(x)));

ProductModels productDetailsFromJson(String str) =>
    ProductModels.fromJson(json.decode(str));

String productodelsToJson(List<ProductModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModels {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModels({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
      };
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
