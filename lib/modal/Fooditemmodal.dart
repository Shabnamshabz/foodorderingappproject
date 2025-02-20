//copy output parameters from postman,paste in quicktype, to generate following code

import 'package:meta/meta.dart';
import 'dart:convert';

FooditemModal fooditemModalFromJson(String str) => FooditemModal.fromJson(json.decode(str));

String fooditemModalToJson(FooditemModal data) => json.encode(data.toJson());

class FooditemModal {
  final int itemId;
  final int categId;
  final String itemName;
  final String itemPrice;
  final String itemImage;

  FooditemModal({
    required this.itemId,
    required this.categId,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
  });

  factory FooditemModal.fromJson(Map<String, dynamic> json) => FooditemModal(
    itemId: json["item_id"],
    categId: json["categ_id"],
    itemName: json["item_name"],
    itemPrice: json["item_price"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "categ_id": categId,
    "item_name": itemName,
    "item_price": itemPrice,
    "item_image": itemImage,
  };
}
