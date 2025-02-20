import 'dart:convert';

import 'package:api_project_shopping_app/Service/localrepositorysharedpreference.dart';
import 'package:api_project_shopping_app/modal/Categorymodal.dart';
import 'package:http/http.dart' as http;

import '../data/api.dart';
import '../modal/Fooditemmodal.dart';

class Productrepository {
  Future<List<FooditemModal>?> fetchallproducts() async {
    try{
      Localrepository abc = Localrepository();
      final response = await http.get(Uri.parse(Api.fetchallproducts), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${await abc.getlogintoken()}"
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
       // print(json['data']); //data will be only fetched, not message and status
        //data is list of map, this need to convert to fooditemlist
        List<FooditemModal> Fooditemlist = List<FooditemModal>.from(
            json["data"].map((mapset) => FooditemModal.fromJson(mapset)));
        // this line of code will get, if we paste complete postman response in quicktype, this will help to extract each mapset from the list of data, and to convert that mapset to the fooditemlist
        return Fooditemlist;
      }
    }
        catch(e)
    {
      print(e.toString());
    }
  }
  Future<List<CategoryModal>?> fetchallcategory()
  async {
    List<CategoryModal> Category=[];
    try{
    final response=await http.get(Uri.parse(Api.fetchcategory));
        if(response.statusCode==200)
          {
            final jsonbody=jsonDecode(response.body);
           // print(jsonbody['data']);
            for (var data in jsonbody["data"]) //products is the key for the list of 30 products
                {
              Category.add(CategoryModal.fromJson(data)); //converting json to dart
            }
            return Category;
          }
    }
    catch(e)
    {
      print(e.toString());
    }
  }
  Future<List<FooditemModal>?> fetchprodunct_category(int categid)
  async{

    try
        {
          List<FooditemModal> Fooditems=[];
          final response=await http.get(Uri.parse('${Api.fetchproductofcategory}/$categid'));
          if(response.statusCode==200)
          {
            final jsonbody=jsonDecode(response.body);
            //print(jsonbody['data']);
            for (var data in jsonbody["data"]) //products is the key for the list of 30 products
                {
              Fooditems.add(FooditemModal.fromJson(data)); //converting json to dart
            }
            return Fooditems;
          }

        }
        catch(e)
    {
      print(e.toString());
    }
  }

}
