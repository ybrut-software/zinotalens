// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) =>
    OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  OrderListModel({
    this.success,
    this.order,
  });

  bool? success;
  List<Order>? order;

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        success: json["success"],
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "order": List<dynamic>.from(order!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.coupon,
    this.total,
    this.id,
    this.oid,
    this.cart,
    this.user,
    this.address,
    this.shipment,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<dynamic>? coupon;
  int? total;
  String? id;
  String? oid;
  Cart? cart;
  String? user;
  Address? address;
  String? shipment;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        coupon: List<dynamic>.from(json["coupon"].map((x) => x)),
        total: json["total"],
        id: json["_id"],
        oid: json["OID"],
        cart: Cart.fromJson(json["cart"]),
        user: json["user"],
        address: Address.fromJson(json["address"]),
        shipment: json["shipment"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "coupon": List<dynamic>.from(coupon!.map((x) => x)),
        "total": total,
        "_id": id,
        "OID": oid,
        "cart": cart?.toJson(),
        "user": user,
        "address": address?.toJson(),
        "shipment": shipment,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Address {
  Address({
    this.id,
    this.fullName,
    this.streetAddress1,
    this.streetAddress2,
    this.contact,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.securityCode,
  });

  String? id;
  String? fullName;
  String? streetAddress1;
  String? streetAddress2;
  int? contact;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic? securityCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        fullName: json["fullName"],
        streetAddress1: json["street_address_1"],
        streetAddress2: json["street_address_2"],
        contact: json["contact"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        securityCode: json["security_code"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "street_address_1": streetAddress1,
        "street_address_2": streetAddress2,
        "contact": contact,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
        "user": user,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "security_code": securityCode,
      };
}

class Cart {
  Cart({
    this.active,
    this.id,
    this.user,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool? active;
  String? id;
  String? user;
  List<Product>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        active: json["active"],
        id: json["_id"],
        user: json["user"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "_id": id,
        "user": user,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.productId,
  });

  String? id;
  String? title;
  int? quantity;
  int? price;
  String? productId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        title: json["title"],
        quantity: json["quantity"],
        price: json["price"],
        productId: json["productId"] == null ? null : json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "quantity": quantity,
        "price": price,
        "productId": productId == null ? null : productId,
      };
}
