// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

ProductEntry productEntryFromJson(String str) => ProductEntry.fromJson(json.decode(str));

String productEntryToJson(ProductEntry data) => json.encode(data.toJson());

class ProductEntry {
    String id;
    String name;
    String description;
    String category;
    String thumbnail;
    int price;
    int stock;
    bool isFeatured;
    dynamic userId;
    dynamic userUsername;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.price,
        required this.stock,
        required this.isFeatured,
        required this.userId,
        required this.userUsername,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"] ?? "",
        price: json["price"],
        stock: json["stock"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        userUsername: json["user_username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "price": price,
        "stock": stock,
        "is_featured": isFeatured,
        "user_id": userId,
        "user_username": userUsername,
    };
}
