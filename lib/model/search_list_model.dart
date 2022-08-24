// To parse this JSON data, do
//
//     final searchListModel = searchListModelFromJson(jsonString);

import 'dart:convert';

SearchListModel searchListModelFromJson(String str) => SearchListModel.fromJson(json.decode(str));

String searchListModelToJson(SearchListModel data) => json.encode(data.toJson());

class SearchListModel {
    SearchListModel({
        this.success,
        this.products,
    });

    bool? success;
    List<Product>? products;

    factory SearchListModel.fromJson(Map<String, dynamic> json) => SearchListModel(
        success: json["success"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
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
        this.specifications,
        this.productId,
        this.highlightResult,
    });

    String? title;
    List<String>? photos;
    int? listPrice;
    int? salesPrice;
    int? averageRating;
    List<dynamic>? reviews;
    Owner? owner;
    Specifications? specifications;
    String? productId;
    HighlightResult? highlightResult;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        listPrice: json["listPrice"],
        salesPrice: json["salesPrice"],
        averageRating: json["averageRating"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        owner: Owner.fromJson(json["owner"]),
        specifications: Specifications.fromJson(json["specifications"]),
        productId: json["objectID"],
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
        "specifications": specifications?.toJson(),
        "objectID": productId,
        "_highlightResult": highlightResult?.toJson(),
    };
}

class HighlightResult {
    HighlightResult({
        this.title,
    });

    Title? title;

    factory HighlightResult.fromJson(Map<String, dynamic> json) => HighlightResult(
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
        this.matchedWords,
    });

    String? value;
    String? matchLevel;
    List<dynamic>? matchedWords;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        value: json["value"],
        matchLevel: json["matchLevel"],
        matchedWords: List<dynamic>.from(json["matchedWords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "matchLevel": matchLevel,
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
        this.specificationsId,
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
    String? specificationsId;

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
        specificationsId: json["id"],
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
        "id": specificationsId,
    };
}
