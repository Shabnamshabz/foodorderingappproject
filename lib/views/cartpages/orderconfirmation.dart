import 'package:api_project_shopping_app/views/application_ui_page/applicationfirstpage.dart';
import 'package:api_project_shopping_app/views/bottombarpages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cartprovider.dart';
class Orderconfirmation extends StatelessWidget {
  const Orderconfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Review Page"),
      ),
      body: Consumer<Cartprovider>(
        builder: (context, value, child) {
          if (value.carts == null) {
            return Center(
                child:
                CircularProgressIndicator()); // Show loader while fetching
          }
          if (value.carts!.data.isEmpty) {
            return Center(
                child: Text("No items in cart")); // Show message when empty
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Food items",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 28
                ),),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                    value.carts != null ? value.carts?.data.length : 0,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Image(
                                        height: 100,
                                        width: 100,
                                        image: NetworkImage(
                                            value.carts!.data[index].itemImage),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(value.carts!.data[index].itemName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),

                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Quantity:", style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                            Text(
                                              value.carts!.data[index].quantity,
                                              style: const TextStyle(fontSize: 20),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                    //"https://tse1.mm.bing.net/th?id=OIP.cjLGdnddziH-G0hmyRnb6wHaHa&pid=Api&P=0&h=220"
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Price:", style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                          Text(
                                            value.carts!.data[index].totalprice,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                          )

                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Center(
                  child: Text(
                    "Order placed for ${value.carts!.granttotal.toString()} rupees",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            value.abc.saveorderdata();
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>Userloginfirstpage(),));
                          },
                          child: Text("Confirm Order")),

                      // child: FilledButton(
                      //     onPressed: () {

                      //     },
                      //     child: const Text("Confirm Order"))),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
