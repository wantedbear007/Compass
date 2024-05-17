// To parse this JSON data, do
//
//     final activitiesModel = activitiesModelFromJson(jsonString);

import 'dart:convert';

ActivitiesModel activitiesModelFromJson(String str) => ActivitiesModel.fromJson(json.decode(str));

String activitiesModelToJson(ActivitiesModel data) => json.encode(data.toJson());

class ActivitiesModel {
  final int? id;
  final String? category;
  final String? title;
  final DateTime? createdDate;
  final String? description;
  final int? type;
  final int? authorId;

  ActivitiesModel({
    this.id,
    this.category,
    this.title,
    this.createdDate,
    this.description,
    this.type,
    this.authorId,
  });

  factory ActivitiesModel.fromJson(Map<String, dynamic> json) => ActivitiesModel(
    id: json["id"],
    category: json["category"],
    title: json["title"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    description: json["description"],
    type: json["type"],
    authorId: json["authorId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "title": title,
    "createdDate": createdDate?.toIso8601String(),
    "description": description,
    "type": type,
    "authorId": authorId,
  };
}
