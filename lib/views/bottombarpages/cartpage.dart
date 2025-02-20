import 'package:api_project_shopping_app/modal/paymentmodaL.dart';
import 'package:api_project_shopping_app/provider/cartprovider.dart';
import 'package:api_project_shopping_app/views/bottombarpages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Repository/cartrepository.dart';
import '../application_ui_page/applicationfirstpage.dart';
import '../cartpages/cartcheckourpages.dart';

class Cartpage extends StatelessWidget {

  Cartrepository xyz = Cartrepository();
  Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.displayLarge,
        ),
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
                            height: 150,
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
                                    Text(
                                      value.carts!.data[index].totalprice,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                                //"https://tse1.mm.bing.net/th?id=OIP.cjLGdnddziH-G0hmyRnb6wHaHa&pid=Api&P=0&h=220"
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            value.incrementcart(value
                                                .carts!.data[index].itemId);
                                          },
                                          icon: const Icon(Icons.add)),
                                      Text(
                                        value.carts!.data[index].quantity,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            value.decrementcart(value
                                                .carts!.data[index].itemId);
                                          },
                                          icon: const Icon(Icons.remove)),
                                      IconButton(
                                          onPressed: () async {
                                            value.deletecart(value
                                                .carts!.data[index].cartId);
                                          },
                                          icon: const Icon(Icons.delete)),
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
                Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(value.carts!.granttotal.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [],
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Checkoutpage(),));
                          },
                          child: Text("Proceed Payment")),

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
