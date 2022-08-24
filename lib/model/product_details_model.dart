// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.success,
    this.product,
  });

  bool? success;
  Product? product;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        success: json["success"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "product": product?.toJson(),
      };
}

class Product {
  Product({
    this.reviews,
    this.stockQuantity,
    this.photos,
    this.id,
    this.title,
    this.description,
    this.shippingFee,
    this.category,
    this.owner,
    this.listPrice,
    this.salesPrice,
    this.specifications,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.averageRating,
    this.productId,
  });

  List<dynamic>? reviews;
  int? stockQuantity;
  List<String>? photos;
  String? id;
  String? title;
  String? description;
  int? shippingFee;
  Category? category;
  Owner? owner;
  int? listPrice;
  int? salesPrice;
  Specifications? specifications;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? averageRating;
  String? productId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        stockQuantity: json["stockQuantity"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        shippingFee: json["shippingFee"],
        category: Category.fromJson(json["category"]),
        owner: Owner.fromJson(json["owner"]),
        listPrice: json["listPrice"],
        salesPrice: json["salesPrice"],
        specifications: Specifications.fromJson(json["specifications"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        averageRating: json["averageRating"],
        productId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews!.map((x) => x)),
        "stockQuantity": stockQuantity,
        "photos": List<dynamic>.from(photos!.map((x) => x)),
        "_id": id,
        "title": title,
        "description": description,
        "shippingFee": shippingFee,
        "category": category?.toJson(),
        "owner": owner?.toJson(),
        "listPrice": listPrice,
        "salesPrice": salesPrice,
        "specifications": specifications?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "averageRating": averageRating,
        "id": productId,
      };
}

class Category {
  Category({
    this.id,
    this.type,
    this.v,
  });

  String? id;
  String? type;
  int? v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        type: json["type"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "__v": v,
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
    this.v,
  });

  String? id;
  String? title;
  String? description;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "photo": photo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Specifications {
  Specifications({
    this.id,
    this.modelNo,
    this.shape,
    this.size,
    this.width,
    this.height,
    this.dimensions,
    this.color,
    this.weight,
    this.weightGroup,
    this.material,
    this.frameMaterial,
    this.templeMaterial,
    this.prescriptionType,
    this.frameStyle1,
    this.frameStyle2,
    this.collections,
    this.warranty,
    this.gender,
    this.condition,
    this.templeColor,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? modelNo;
  String? shape;
  String? size;
  String? width;
  String? height;
  String? dimensions;
  String? color;
  String? weight;
  String? weightGroup;
  String? material;
  String? frameMaterial;
  String? templeMaterial;
  String? prescriptionType;
  String? frameStyle1;
  String? frameStyle2;
  String? collections;
  String? warranty;
  String? gender;
  String? condition;
  String? templeColor;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Specifications.fromJson(Map<String, dynamic> json) => Specifications(
        id: json["_id"],
        modelNo: json["model_no"],
        shape: json["shape"],
        size: json["size"],
        width: json["width"],
        height: json["height"],
        dimensions: json["dimensions"],
        color: json["color"],
        weight: json["weight"],
        weightGroup: json["weight_group"],
        material: json["material"],
        frameMaterial: json["frame_material"],
        templeMaterial: json["temple_material"],
        prescriptionType: json["prescription_type"],
        frameStyle1: json["frame_style_1"],
        frameStyle2: json["frame_style_2"],
        collections: json["collections"],
        warranty: json["warranty"],
        gender: json["gender"],
        condition: json["condition"],
        templeColor: json["temple_color"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "model_no": modelNo,
        "shape": shape,
        "size": size,
        "width": width,
        "height": height,
        "dimensions": dimensions,
        "color": color,
        "weight": weight,
        "weight_group": weightGroup,
        "material": material,
        "frame_material": frameMaterial,
        "temple_material": templeMaterial,
        "prescription_type": prescriptionType,
        "frame_style_1": frameStyle1,
        "frame_style_2": frameStyle2,
        "collections": collections,
        "warranty": warranty,
        "gender": gender,
        "condition": condition,
        "temple_color": templeColor,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
