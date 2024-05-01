// import 'dart:convert';
//
// class ProductModel {
//   final String? uniqueId;
//   final String? name;
//   final DateTime? createdDate;
//   final int? qty;
//   final DateTime? expireDate;
//   final String? imageUrl;
//   final String? barcodeId;
//   final String? category;
//   final String? manufacturer;
//
//   ProductModel({
//     this.uniqueId,
//     this.name,
//     this.createdDate,
//     this.qty,
//     this.expireDate,
//     this.imageUrl,
//     this.barcodeId,
//     this.category,
//     this.manufacturer,
//   });
//
//   ProductModel copyWith({
//     String? uniqueId,
//     String? name,
//     DateTime? createdDate,
//     int? qty,
//     DateTime? expireDate,
//     String? imageUrl,
//     String? barcodeId,
//     String? category,
//     String? manufacturer,
//   }) =>
//       ProductModel(
//         uniqueId: uniqueId ?? this.uniqueId,
//         name: name ?? this.name,
//         createdDate: createdDate ?? this.createdDate,
//         qty: qty ?? this.qty,
//         expireDate: expireDate ?? this.expireDate,
//         imageUrl: imageUrl ?? this.imageUrl,
//         barcodeId: barcodeId ?? this.barcodeId,
//         category: category ?? this.category,
//         manufacturer: manufacturer ?? this.manufacturer,
//       );
//
//   factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//     uniqueId: json["UniqueID"],
//     name: json["Name"],
//     createdDate: json["CreatedDate"] == null ? null : DateTime.parse(json["CreatedDate"]),
//     qty: json["Qty"],
//     expireDate: json["ExpireDate"] == null ? null : DateTime.parse(json["ExpireDate"]),
//     imageUrl: json["ImageURL"],
//     barcodeId: json["BarcodeID"],
//     category: json["Category"],
//     manufacturer: json["Manufacturer"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "UniqueID": uniqueId,
//     "Name": name,
//     "CreatedDate": createdDate?.toIso8601String(),
//     "Qty": qty,
//     "ExpireDate": "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
//     "ImageURL": imageUrl,
//     "BarcodeID": barcodeId,
//     "Category": category,
//     "Manufacturer": manufacturer,
//   };
// }
