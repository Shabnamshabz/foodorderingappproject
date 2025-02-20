// To parse this JSON data, do
//
//     final cartModal = cartModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CartModal cartModalFromJson(String str) => CartModal.fromJson(json.decode(str));

String cartModalToJson(CartModal data) => json.encode(data.toJson());

class CartModal {
  final bool status;
  final String message;
  final List<Datum> data;
  final int granttotal;

  CartModal({
    required this.status,
    required this.message,
    required this.data,
    required this.granttotal,
  });

  factory CartModal.fromJson(Map<String, dynamic> json) => CartModal(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    granttotal: json["granttotal"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "granttotal": granttotal,
  };
}

class Datum {
  final int cartId;
  final int itemId;
  final int custId;
  final String quantity;
  final String totalprice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int categId;
  final String itemName;
  final String itemPrice;
  final String itemImage;

  Datum({
    required this.cartId,
    required this.itemId,
    required this.custId,
    required this.quantity,
    required this.totalprice,
    required this.createdAt,
    required this.updatedAt,
    required this.categId,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    cartId: json["cart_id"],
    itemId: json["item_id"],
    custId: json["cust_id"],
    quantity: json["quantity"],
    totalprice: json["totalprice"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categId: json["categ_id"],
    itemName: json["item_name"],
    itemPrice: json["item_price"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "item_id": itemId,
    "cust_id": custId,
    "quantity": quantity,
    "totalprice": totalprice,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "categ_id": categId,
    "item_name": itemName,
    "item_price": itemPrice,
    "item_image": itemImage,
  };
}
