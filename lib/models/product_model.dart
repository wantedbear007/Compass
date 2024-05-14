// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final int? id;
  final String? barCodeId;
  final String? expireDate;
  final String? name;
  final String? description;
  final String? region;
  final String? imageUrl;
  final String? brand;
  final String? category;
  final String? createdDate;

  ProductModel({
    this.id,
    this.barCodeId,
    this.expireDate,
    this.name,
    this.description,
    this.region,
    this.imageUrl,
    this.brand,
    this.category,
    this.createdDate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    barCodeId: json["barCodeID"],
    expireDate: json["expireDate"],
    name: json["name"],
    description: json["description"],
    region: json["region"],
    imageUrl: json["imageUrl"],
    brand: json["brand"],
    category: json["category"],
    createdDate: json["createdDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "barCodeID": barCodeId,

    "expireDate": expireDate,
    "name": name,
    "description": description,
    "region": region,
    "imageUrl": imageUrl,
    "brand": brand,
    "category": category,
    "createdDate": createdDate,
  };
}
