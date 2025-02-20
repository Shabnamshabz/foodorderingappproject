import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/fooditemprovider.dart';
import 'IndividualProductDisplayPage.dart';
class Categorypage extends StatelessWidget {
  final int Categid;
   Categorypage({required this.Categid});


  @override
  Widget build(BuildContext context) {
    context.read<Fooditemprovider>().fetchprodunct_category(Categid);

    return Scaffold(
      appBar: AppBar(

      ),
      body: Consumer<Fooditemprovider>(builder: (BuildContext context, value, Widget? child)
      {
        return ListView.builder(

          itemCount: value.categ_Fooditems.length,
          itemBuilder: (context, index) {

          return GestureDetector (onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
             return ProductDisplayMainPage(fooditems: value.categ_Fooditems[index]);
            },));
          },

            child: Column(
              children: [
                   Image(image: NetworkImage(value.categ_Fooditems[index].itemImage)),
                Text(value.categ_Fooditems[index].itemName,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text(value.categ_Fooditems[index].itemPrice,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                Divider(),

              ],
            ),
          );
        },);
      },

      ),
    );
  }
}

