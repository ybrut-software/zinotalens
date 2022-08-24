// To parse this JSON data, do
//
//     final searchListModel = searchListModelFromJson(jsonString);

import 'dart:convert';

SearchListModel searchListModelFromJson(String str) =>
    SearchListModel.fromJson(json.decode(str));

String searchListModelToJson(SearchListModel data) =>
    json.encode(data.toJson());

class SearchListModel {
  SearchListModel({
    this.success,
    this.products,
  });

  bool? success;
  List<Product>? products;

  factory SearchListModel.fromJson(Map<String, dynamic> json) =>
      SearchListModel(
        success: json["success"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.title,
    this.photos,
    this.listPrice,
    this.salesPrice,
    this.averageRating,
    this.reviews,
    this.owner,
    this.objectId,
    this.highlightResult,
  });

  String? title;
  List<String>? photos;
  int? listPrice;
  int? salesPrice;
  int? averageRating;
  List<dynamic>? reviews;
  Owner? owner;
  String? objectId;
  HighlightResult? highlightResult;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        listPrice: json["listPrice"],
        salesPrice: json["salesPrice"],
        averageRating: json["averageRating"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        owner: Owner.fromJson(json["owner"]),
        objectId: json["objectID"],
        highlightResult: HighlightResult.fromJson(json["_highlightResult"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "photos": List<dynamic>.from(photos!.map((x) => x)),
        "listPrice": listPrice,
        "salesPrice": salesPrice,
        "averageRating": averageRating,
        "reviews": List<dynamic>.from(reviews!.map((x) => x)),
        "owner": owner?.toJson(),
        "objectID": objectId,
        "_highlightResult": highlightResult?.toJson(),
      };
}

class HighlightResult {
  HighlightResult({
    this.title,
  });

  Title? title;

  factory HighlightResult.fromJson(Map<String, dynamic> json) =>
      HighlightResult(
        title: Title.fromJson(json["title"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title?.toJson(),
      };
}

class Title {
  Title({
    this.value,
    this.matchLevel,
    this.fullyHighlighted,
    this.matchedWords,
  });

  String? value;
  String? matchLevel;
  bool? fullyHighlighted;
  List<String>? matchedWords;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        value: json["value"],
        matchLevel: json["matchLevel"],
        fullyHighlighted: json["fullyHighlighted"],
        matchedWords: List<String>.from(json["matchedWords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "matchLevel": matchLevel,
        "fullyHighlighted": fullyHighlighted,
        "matchedWords": List<dynamic>.from(matchedWords!.map((x) => x)),
      };
}

class Owner {
  Owner({
    this.id,
    this.title,
    this.description,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.ownerId,
  });

  String? id;
  String? title;
  String? description;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? ownerId;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        ownerId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "photo": photo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": ownerId,
      };
}
