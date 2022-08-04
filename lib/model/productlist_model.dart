// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) =>
    List<ProductListModel>.from(
        json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
  ProductListModel({
    this.productId,
    this.title,
    this.description,
    this.rating,
    this.stockQuantity,
    this.photo,
    this.categoryId,
    this.price,
    this.ownerId,
    this.specificationId,
    this.reviewId,
  });

  String? productId;
  String? title;
  String? description;
  double? rating;
  int? stockQuantity;
  String? photo;
  String? categoryId;
  Price? price;
  String? ownerId;
  String? specificationId;
  String? reviewId;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        productId: json["productId"],
        title: json["title"],
        description: json["description"],
        rating: json["rating"].toDouble(),
        stockQuantity: json["stockQuantity"],
        photo: json["photo"],
        categoryId: json["categoryId"],
        price: Price.fromJson(json["price"]),
        ownerId: json["ownerId"],
        specificationId: json["specificationId"],
        reviewId: json["reviewId"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "description": description,
        "rating": rating,
        "stockQuantity": stockQuantity,
        "photo": photo,
        "categoryId": categoryId,
        "price": price?.toJson(),
        "ownerId": ownerId,
        "specificationId": specificationId,
        "reviewId": reviewId,
      };
}

class Price {
  Price({
    this.listingPrice,
    this.sellingPrice,
    this.discountPrice,
    this.shippingFee,
  });

  int? listingPrice;
  int? sellingPrice;
  int? discountPrice;
  int? shippingFee;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        listingPrice: json["listingPrice"],
        sellingPrice: json["sellingPrice"],
        discountPrice: json["discountPrice"],
        shippingFee: json["shippingFee"],
      );

  Map<String, dynamic> toJson() => {
        "listingPrice": listingPrice,
        "sellingPrice": sellingPrice,
        "discountPrice": discountPrice,
        "shippingFee": shippingFee,
      };
}
