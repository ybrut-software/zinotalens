// To parse this JSON data, do
//
//     final shipmentModel = shipmentModelFromJson(jsonString);

import 'dart:convert';

ShipmentModel shipmentModelFromJson(String str) =>
    ShipmentModel.fromJson(json.decode(str));

String shipmentModelToJson(ShipmentModel data) => json.encode(data.toJson());

class ShipmentModel {
  ShipmentModel({
    this.success,
    this.shipment,
  });

  bool? success;
  Shipment? shipment;

  factory ShipmentModel.fromJson(Map<String, dynamic> json) => ShipmentModel(
        success: json["success"],
        shipment: Shipment.fromJson(json["shipment"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "shipment": shipment?.toJson(),
      };
}

class Shipment {
  Shipment({
    this.orderPlaced,
    this.orderShipped,
    this.outForDelivery,
    this.orderDelivered,
    this.orderCancelled,
    this.id,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool? orderPlaced;
  bool? orderShipped;
  bool? outForDelivery;
  bool? orderDelivered;
  bool? orderCancelled;
  String? id;
  String? order;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        orderPlaced: json["order_placed"],
        orderShipped: json["order_shipped"],
        outForDelivery: json["out_for_delivery"],
        orderDelivered: json["order_delivered"],
        orderCancelled: json["order_cancelled"],
        id: json["_id"],
        order: json["order"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "order_placed": orderPlaced,
        "order_shipped": orderShipped,
        "out_for_delivery": outForDelivery,
        "order_delivered": orderDelivered,
        "order_cancelled": orderCancelled,
        "_id": id,
        "order": order,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
