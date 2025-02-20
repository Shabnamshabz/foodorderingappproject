import 'package:api_project_shopping_app/Repository/productrepository.dart';
import 'package:api_project_shopping_app/modal/Fooditemmodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../modal/Categorymodal.dart';

class Fooditemprovider extends ChangeNotifier {

  Productrepository abc = Productrepository();
  List<FooditemModal> Fooditems = [];
  List<FooditemModal> categ_Fooditems = [];
  List<CategoryModal> Categories = [];

  void getfood() async {
    final fetcheditems = await abc.fetchallproducts();
    if (fetcheditems!=null) {
      Fooditems = fetcheditems;
    }
    notifyListeners();
  }
  Future<void> getcategory()
  async {
    final fetchedcategory = await abc.fetchallcategory();
    if (fetchedcategory!=null) {
      Categories= fetchedcategory;
    }
    notifyListeners();

  }
  Future<void> fetchprodunct_category(int categid)
  async{
    final fetched_prod_categ=await abc.fetchprodunct_category(categid);
    if(fetched_prod_categ!=null)
      {
        categ_Fooditems=fetched_prod_categ;
      }
    notifyListeners();
  }
  Fooditemprovider()
  {
    getfood();
    getcategory();
  }


}
