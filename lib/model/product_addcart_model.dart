class ProductAddCartModel {
  String? product_id;
  int? product_quantity;
  double? product_price;

  ProductAddCartModel(
      {this.product_id, this.product_price, this.product_quantity});

  factory ProductAddCartModel.fromMap(Map<String, dynamic> map) =>
      ProductAddCartModel(
          product_id: map["product_id"],
          product_price: map["price"],
          product_quantity: map["quantity"]);

  Map<String, dynamic> toMap() => {
        "product_id": product_id,
        "price": product_price,
        "quantity": product_quantity
      };
}
