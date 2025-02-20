import 'package:api_project_shopping_app/Repository/cartrepository.dart';
import 'package:api_project_shopping_app/modal/Fooditemmodal.dart';
import 'package:api_project_shopping_app/modal/paymentmodaL.dart';
import 'package:flutter/material.dart';

import '../modal/cartmodal.dart';

class Cartprovider extends ChangeNotifier {
  Cartprovider() {
    fetchpayment();
    fetchedcart();
  }
  CartModal? carts;
  List<Payment> payments=[];
  Cartrepository abc = Cartrepository();
  void fetchedcart() async {
    final fetchedcarts = await abc.fetchedcart();
    if (fetchedcarts != null) {
      carts = fetchedcarts;
      notifyListeners();
    }
    print(carts);

  }
  void addtocart(int itemid, int quantity) async {
    await abc.addtocart(itemid, quantity);
    fetchedcart();
    notifyListeners();
  }
  void incrementcart(int item_id) async {
    await abc.incrementquantityofcart(item_id);
    fetchedcart();
    notifyListeners();
  }

  void decrementcart(int item_id) async {
    await abc.decrementquantityofcart(item_id);
    fetchedcart();
    notifyListeners();
  }

  void deletecart(int cartid) async {
    await abc.deletecart(cartid);
    fetchedcart();
    notifyListeners();
  }
  void addpayment(String cardno,String expdate,String cvv)
  async{
    await abc.addpaymentdetails(cardno,expdate,cvv);
    notifyListeners();
  }

  void fetchpayment()
  async
  {
    final fetchpayment=await abc.fetchPayments();
    if(fetchpayment!=null)
      {
        payments=fetchpayment;
      }
    notifyListeners();
  }
  void saveorder()
  async{
    await abc.saveorderdata();
    notifyListeners();
  }


}
