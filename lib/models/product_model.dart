// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final int id;
  final DateTime expireDate;
  final String barCodeId;
  final String name;
  final String description;
  final String region;
  final String imageUrl;
  final String brand;
  final String category;
  final DateTime createdDate;
  final int authorId;

  ProductModel({
    required this.id,
    required this.expireDate,
    required this.barCodeId,
    required this.name,
    required this.description,
    required this.region,
    required this.imageUrl,
    required this.brand,
    required this.category,
    required this.createdDate,
    required this.authorId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    expireDate: DateTime.parse(json["expireDate"]),
    barCodeId: json["barCodeID"],
    name: json["name"],
    description: json["description"],
    region: json["region"],
    imageUrl: json["imageUrl"],
    brand: json["brand"],
    category: json["category"],
    createdDate: DateTime.parse(json["createdDate"]),
    authorId: json["authorId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "expireDate": "${expireDate.year.toString().padLeft(4, '0')}-${expireDate.month.toString().padLeft(2, '0')}-${expireDate.day.toString().padLeft(2, '0')}",
    "barCodeID": barCodeId,
    "name": name,
    "description": description,
    "region": region,
    "imageUrl": imageUrl,
    "brand": brand,
    "category": category,
    "createdDate": createdDate.toIso8601String(),
    "authorId": authorId,
  };
}
