import 'dart:convert';

List<ProductAddCartModel> productAddCartModelFromMap(String str) => List<ProductAddCartModel>.from(json.decode(str).map((x) => ProductAddCartModel.fromMap(x)));

String productAddCartModelToMap(List<ProductAddCartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));


class ProductAddCartModel {
  String? productId;
  String? productTitle;
  String? productSize;
  String? productPhoto;
  int? productQuantity;
  int? productListingPrice;
  int? productSellingPrice;

  ProductAddCartModel(
      {this.productId,
      this.productListingPrice,
      this.productQuantity,
      this.productSellingPrice,
      this.productPhoto,
      this.productSize,
      this.productTitle});

  factory ProductAddCartModel.fromMap(Map<String, dynamic> map) =>
      ProductAddCartModel(
          productId: map["product_id"],
          productListingPrice: map["listing_price"],
          productQuantity: map["quantity"],
          productSellingPrice: map["selling_price"],
          productPhoto: map["photo"],
          productSize: map["size"],
          productTitle: map["title"]);

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "listing_price": productListingPrice,
        "quantity": productQuantity,
        "selling_price": productSellingPrice,
        "photo": productPhoto,
        "size": productSize,
        "title": productTitle
      };
}
