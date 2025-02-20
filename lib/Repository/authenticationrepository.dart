import 'dart:convert';

import 'package:api_project_shopping_app/Service/localrepositorysharedpreference.dart';
import 'package:api_project_shopping_app/data/api.dart';
import 'package:api_project_shopping_app/modal/usermodal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  Future<void> register(UserModal user) async {
    try {
      final response = await http.post(Uri.parse(Api.register),
          body: jsonEncode(user.toJson()), //give data to there
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json"
          });
      print(response.body); //output of postman
      if (response.statusCode == 201) //new add to database
      {
        final json = jsonDecode(response.body); //take data from there
        print(json[
            'message']); //sometimes this can modified to print whole message,status and data, of json response, if only print(json) is given. Here we want only message from jsonresponse thus use print(json['message'])
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(Api.login),
          body: jsonEncode({
            "c_email":
                email, // assign the velue of email in the parameter to the variable name in php($req->post(c_name)) , which in turn assign thhe value in c_name to database coloumn name.
            "c_pass": password,
          }),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json"
          });

      // print(response.body);
      if (response.statusCode == 200) {
        Localrepository save = Localrepository();
        final json = jsonDecode(response.body);
        String usertoken = json['token']; //get token value from json
        save.savelogintoken(
            usertoken); //save this token to sharedpreference service(local repository)
        return true;
      }
      else
        {
          Fluttertoast.showToast(
              msg: "Login Failed, User not found!",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          return false;
        }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Login Failed, User not found!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
  }
  Future<bool> signout()
  async {
    Localrepository token=Localrepository();
    try
        {
          final response=await http.post(Uri.parse(Api.signout),
              headers: {
                "Accept": "application/json",
                "Authorization":"Bearer ${await token.getlogintoken()}"
              });
          if (response.statusCode == 200)
          {
            token.removetoken();
            final json=jsonDecode(response.body);
            Fluttertoast.showToast(
                msg: json['message'],
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            return true;

          }
          else
            {
              Fluttertoast.showToast(
                  msg:"signout failed",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              return false;
            }
        }
    catch (e) {
      print(e.toString());
      return false;
    }

  }


}
