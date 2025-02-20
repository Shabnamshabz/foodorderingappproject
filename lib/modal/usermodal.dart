// To parse this JSON data, do
//
//     final userModal = userModalFromJson(jsonString);

import 'dart:convert';

UserModal userModalFromJson(String str) => UserModal.fromJson(json.decode(str));

String userModalToJson(UserModal data) => json.encode(data.toJson());

class UserModal {
  final int? customerId;
  final String? customerName;
  final String? customerEmail;
  final String? customerPass;
  final String? customerPhno;

  UserModal({
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerPass,
    this.customerPhno,
  });
 //accessing value stored in database, thus used  from json method , thus accessing  customer id from database coloumnname named as customer_id in database using json["customer_id"], and assigning this value to the variable here named as customerId
  factory UserModal.fromJson(Map<String, dynamic> json) => UserModal(
    customerId: json["customer_id"], //customer_id  is coloumn the name given in database, in which we store the id of customer, this value had accessed and asssigned  to the variable name customerId here.
    customerName: json["customer_name"],
    customerEmail: json["customer_email"],
    customerPass: json["customer_pass"],
    customerPhno: json["customer_phno"],
  );
// sending value of the field, thus used to json method, thus assign the value(customerName) entered here to the the variable name(c_name) given in php.  In php, it(c_name) will in turn assign that value to $insert->databasecoloumnname , to store data in database
  Map<String, dynamic> toJson() => {
    "c_name": customerName, //c_name is the name of variable name in php, which accept  value from here, and assign value to database
    "c_email": customerEmail,// customerName is the variable name here in flutter, which accepts the name of user typed in textbox
    "c_pass": customerPass,
    "c_phno": customerPhno,
  };
}
//it is always adviced to use same varbiable name in  php,database and flutter, for all constraints, to avoid confusions