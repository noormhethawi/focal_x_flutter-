import 'dart:convert';

class CategoriesModel {
  List<Datum1> data;
  String message;

  CategoriesModel({
    required this.data,
    required this.message,
  });

  factory CategoriesModel.fromRawJson(String str) =>
      CategoriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        data: List<Datum1>.from(json["data"].map((x) => Datum1.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum1 {
  int id;
  String name;
  SubCategory subCategory;
  String image;
  int price;
  int evaluation;
  int discount;
  int quantity;

  Datum1({
    required this.id,
    required this.name,
    required this.subCategory,
    required this.image,
    required this.price,
    required this.evaluation,
    required this.discount,
    this.quantity = 1,
  });

  factory Datum1.fromRawJson(String str) => Datum1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum1.fromJson(Map<String, dynamic> json) => Datum1(
        id: json["id"],
        name: json["name"],
        subCategory: SubCategory.fromJson(json["sub-category"]),
        image: json["image"],
        price: json["price"],
        evaluation: json["evaluation"],
        discount: json["discount"],
        quantity: json["quantity"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub-category": subCategory.toJson(),
        "image": image,
        "price": price,
        "evaluation": evaluation,
        "discount": discount,
        "quantity": quantity,
      };
}

class SubCategory {
  int id;
  String name;
  Category category;

  SubCategory({
    required this.id,
    required this.name,
    required this.category,
  });

  factory SubCategory.fromRawJson(String str) =>
      SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category.toJson(),
      };
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
