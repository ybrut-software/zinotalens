// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
    CardModel({
        this.cardNumber,
        this.expiryDate,
        this.cvvCode,
    });

    String? cardNumber;
    String? expiryDate;
    String? cvvCode;

    factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        cardNumber: json["cardNumber"],
        expiryDate: json["expiryDate"],
        cvvCode: json["cvvCode"],
    );

    Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "expiryDate": expiryDate,
        "cvvCode": cvvCode,
    };
}
