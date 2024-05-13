// To parse this JSON data, do
//
//     final barCodeProduct = barCodeProductFromJson(jsonString);

import 'dart:convert';

BarCodeProduct barCodeProductFromJson(String str) => BarCodeProduct.fromJson(json.decode(str));

String barCodeProductToJson(BarCodeProduct data) => json.encode(data.toJson());

class BarCodeProduct {
  final String? name;
  final String? description;
  final String? region;
  final String? imageUrl;
  final String? brand;
  final List<List<String>>? specs;
  final String? category;
  final List<String>? categoryPath;
  final dynamic upc;
  final int? ean;

  BarCodeProduct({
    this.name,
    this.description,
    this.region,
    this.imageUrl,
    this.brand,
    this.specs,
    this.category,
    this.categoryPath,
    this.upc,
    this.ean,
  });

  factory BarCodeProduct.fromJson(Map<String, dynamic> json) => BarCodeProduct(
    name: json["name"],
    description: json["description"],
    region: json["region"],
    imageUrl: json["imageUrl"],
    brand: json["brand"],
    specs: json["specs"] == null ? [] : List<List<String>>.from(json["specs"]!.map((x) => List<String>.from(x.map((x) => x)))),
    category: json["category"],
    categoryPath: json["categoryPath"] == null ? [] : List<String>.from(json["categoryPath"]!.map((x) => x)),
    upc: json["upc"],
    ean: json["ean"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "region": region,
    "imageUrl": imageUrl,
    "brand": brand,
    "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "category": category,
    "categoryPath": categoryPath == null ? [] : List<dynamic>.from(categoryPath!.map((x) => x)),
    "upc": upc,
    "ean": ean,
  };
}
