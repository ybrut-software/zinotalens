// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
    CardModel({
        this.cardNumber,
        this.expiryMonth,
        this.expiryYear,
        this.cvvCode,
    });

    String? cardNumber;
    String? expiryMonth;
    String? expiryYear;
    String? cvvCode;

    factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        cardNumber: json["number"],
        expiryMonth: json["exp_month"],
        expiryYear: json["exp_year"],
        cvvCode: json["cvc"],
    );

    Map<String, String> toJson() => {
        "number": cardNumber!,
        "exp_month": expiryMonth!,
        "exp_year" : expiryYear!,
        "cvc": cvvCode!,
    };
}
