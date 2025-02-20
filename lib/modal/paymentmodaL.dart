// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  final String cardnumber;
  final String expirydate;
  final String securitycode;

  Payment({
    required this.cardnumber,
    required this.expirydate,
    required this.securitycode,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    cardnumber: json["cardnumber"],
    expirydate: json["expirydate"],
    securitycode: json["securitycode"],
  );

  Map<String, dynamic> toJson() => {
    "cardnumber": cardnumber,
    "expirydate": expirydate,
    "securitycode": securitycode,
  };
}
