import 'dart:convert';

import 'package:api_project_shopping_app/Service/localrepositorysharedpreference.dart';
import 'package:api_project_shopping_app/modal/Fooditemmodal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../data/api.dart';
import '../modal/cartmodal.dart';
import '../modal/paymentmodaL.dart';

class Cartrepository {
  Future<void> addtocart(int itemid, int quantity) async {
    Localrepository abc = Localrepository();
    final response = await http.post(
        Uri.parse('${Api.addtocartbutton}/$itemid'),
        //if jsonencode is given in body, then we mist specify, contentype:application/json in headers, or else don't give jsonencode in body
        body: {
          "quantity": quantity.toString()
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${await abc.getlogintoken()}"
        });
    //print("Response Status: ${response.statusCode}");
    //print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Fluttertoast.showToast(msg: json['message']);
    } else {
      Fluttertoast.showToast(msg: "Failed to add item to cart");
    }
  }

  Future<void> incrementquantityofcart(int item_id) async {
    Localrepository abc = Localrepository();
    final response = await http
        .post(Uri.parse("${Api.incrementquantity}/$item_id"), headers: {
      "Accept": "Application/json",
      "Authorization": "Bearer ${await abc.getlogintoken()}"
    });
    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Fluttertoast.showToast(msg: json['message']);
    } else {
      Fluttertoast.showToast(msg: "Failed: ${response.statusCode}");
    }
  }

  Future<void> decrementquantityofcart(int item_id) async {
    try {
      Localrepository abc = Localrepository();
      String? token = await abc.getlogintoken();

      final response = await http.post(
        Uri.parse("${Api.decrementquantity}/$item_id"), // Correct URL
        headers: {
          "Accept": "application/json", // Ensure lowercase
          "Authorization": "Bearer $token" // Correct spelling + Bearer prefix
        },
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        Fluttertoast.showToast(msg: json['message']);
      } else {
        Fluttertoast.showToast(msg: "Failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  Future<void> deletecart(int cartid) async {
    Localrepository abc = Localrepository();
    final response =
    await http.delete(Uri.parse("${Api.deletecartitem}/$cartid"), headers: {
      "Accept": "Application/json",
      "Authorization": "Bearer ${await abc.getlogintoken()}"
    });
    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Fluttertoast.showToast(msg: json['message']);
    }
  }

  Future<CartModal?> fetchedcart() async {
    try {
      Localrepository abc = Localrepository();
      final response = await http.get(
        Uri.parse(Api.usercartpagedisplay),
        headers: {
          "Accept": "Application/json",
          "Authorization":
          "Bearer ${await abc.getlogintoken()}" // Corrected spelling
        },
      );
      print("${await abc.getlogintoken()}");
      if (response.statusCode == 200) {
        final jsonbody = jsonDecode(response.body);
        print(response.body);
        return CartModal.fromJson(jsonbody);
      } else {
        print("Failed to fetch cart: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching cart: $e");
    }
    return null;
  }

  Future<void> addpaymentdetails(String cardno, String expdate,
      String cvv) async {
    Localrepository abc = Localrepository();
    final response = await http.post(
      Uri.parse("${Api.paymentpage}"),
      body: {
        "card_no": cardno,
        "exp_date": expdate,
        "cvv": cvv
      }, // Convert to JSON string
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${await abc.getlogintoken()}"
      },
    );
    print("Bearer ${await abc.getlogintoken()}");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(response.body);
      Fluttertoast.showToast(msg: json['message']);
    } else {
      Fluttertoast.showToast(msg: "Failed to add payment details");
    }
  }

  Future<List<Payment>> fetchPayments() async {
    Localrepository abc = Localrepository();
    final response = await http.get(
      Uri.parse(Api.getPayments), // Replace with your actual API endpoint
      headers: {
        "Accept": "Application/json",
        "Authorization": "Bearer ${await abc.getlogintoken()}",
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'true') {
        List<dynamic> paymentList = jsonData['data'];
        return paymentList.map((json) => Payment.fromJson(json)).toList();
      } else {
        Fluttertoast.showToast(msg: jsonData['message']);
        return [];
      }
    } else {
      Fluttertoast.showToast(msg: "Failed to fetch payments");
      return [];
    }
  }

  Future<void> saveorderdata() async {
    Localrepository abc = Localrepository();
    final response = await http.post(
      Uri.parse("${Api.saveorder}"),
      headers: {
        "Accept": "Application/json",
        "Authorization": "Bearer ${await abc.getlogintoken()}",
      },
    );

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Fluttertoast.showToast(msg: json['message']);
    } else {
      Fluttertoast.showToast(msg: "Order failed");
    }
  }
}

//   Future<void> saveorderdata()
//   async{
//     Localrepository abc=Localrepository();
//     final response=await http.post(Uri.parse("${Api.saveorder}"),
//     headers: {
//       "Accept": "Application/json",
//       "Authorization": "Bearer ${await abc.getlogintoken()}",
//     });
//     if(response.statusCode==200)
//      var json=jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       Fluttertoast.showToast(msg: json['message']);
//     } else {
//       Fluttertoast.showToast(msg: "Order failed");
//     }
//
//
//
//   }
// }
