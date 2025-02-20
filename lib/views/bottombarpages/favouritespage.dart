import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/fooditemprovider.dart';
class Favouritespage extends StatelessWidget {
  const Favouritespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Grab the food!",style:Theme.of(context).textTheme.displayLarge),
      ),
      body:Consumer<Fooditemprovider>(builder: (context, value, child) {
        // value.getfood(); //function call
        return GridView.builder(
          itemCount:value.Fooditems.length,
          itemBuilder: (context, index)
          {

            return Column(
              children: [
                Expanded(child: Image(image: NetworkImage(value.Fooditems[index].itemImage))),
                Text(value.Fooditems[index].itemName),
                Text(value.Fooditems[index].itemPrice),
                Divider()
              ],
            );
          }, gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        );
      } ,)
    );
  }
}
