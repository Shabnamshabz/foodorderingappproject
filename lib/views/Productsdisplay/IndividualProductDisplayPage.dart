import 'dart:math';
import 'package:api_project_shopping_app/modal/Fooditemmodal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../Common widgets/dateformat.dart';
import '../../provider/cartprovider.dart';
import '../bottombarpages/cartpage.dart';

class ProductDisplayMainPage extends StatelessWidget {
  TextEditingController quantityController = TextEditingController();
  final FooditemModal fooditems;

  ProductDisplayMainPage({super.key, required this.fooditems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Product Image
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  fooditems.itemImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Product Name
            Text(
              fooditems.itemName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),

            // Product Price
            Text(
              'Price: \$${fooditems.itemPrice}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Divider
            Divider(thickness: 1, color: Colors.grey[400]),

            // Quantity Input Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quantity:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 100,
                    child: TextField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '1',
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
                  ),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    if (quantityController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Please enter a valid quantity.");
                      return;
                    }

                    int quantity = int.tryParse(quantityController.text) ?? 0;
                    if (quantity <= 0) {
                      Fluttertoast.showToast(msg: "Quantity must be greater than 0.");
                      return;
                    }

                    // Add to cart
                    context.read<Cartprovider>().addtocart(fooditems.itemId, quantity);
                    Fluttertoast.showToast(msg: "Item added to cart.");

                    // Navigate to the cart page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cartpage()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'dart:math';
//
// import 'package:api_project_shopping_app/modal/Fooditemmodal.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
//
// import '../../Common widgets/dateformat.dart';
// import '../../provider/cartprovider.dart';
// import '../bottombarpages/cartpage.dart';
// class ProductDisplayMainPage extends StatelessWidget {
//   TextEditingController quantitycontroller=TextEditingController();
//   final FooditemModal fooditems; // datatype is a class
//   ProductDisplayMainPage({super.key,required this.fooditems});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height*0.30,
//               width: double.infinity,
//               child: Image(image: NetworkImage(fooditems.itemImage),fit:BoxFit.fitHeight,),
//             ),
//             Text(fooditems.itemName,style:TextStyle(fontSize:22,fontWeight:FontWeight.bold),),
//             Text(fooditems.itemPrice,style:TextStyle(fontSize:12,fontWeight:FontWeight.bold),),
//             Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("QUANTITY:",style:TextStyle(fontSize:22,fontWeight:FontWeight.bold)),
//                 Expanded(
//                   child: TextField(
//                     controller: quantitycontroller,
//                     keyboardType: TextInputType.number, // Make it numeric only
//                     decoration: InputDecoration(
//                       labelText: 'Quantity',
//                       labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Customize the label style
//                       hintText: 'Enter quantity',
//                       hintStyle: TextStyle(fontSize: 14, color: Colors.grey), // Hint text style
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10), // Rounded corners for the border
//                         borderSide: BorderSide(color: Colors.blue, width: 2), // Border color and width
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.blue, width: 2), // Focused border color
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.grey, width: 1), // Normal border color
//                       ),
//                       prefixIcon: Icon(Icons.shopping_cart, color: Colors.blue), // Optional icon before the text
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: FilledButton(
//                     child: const Text("Add to cart"),
//                     onPressed: () {
//                       if (quantitycontroller.text.isEmpty) {
//                         Fluttertoast.showToast(msg: "Enter a valid quantity");
//                         return;
//                       }
//
//                       int quantity = int.tryParse(quantitycontroller.text) ?? 0;
//                       if (quantity <= 0) {
//                         Fluttertoast.showToast(msg: "Quantity must be greater than 0");
//                         return;
//                       }
//
//                       context.read<Cartprovider>().addtocart(fooditems.itemId, quantity);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Cartpage()),
//                       );
//                     }),
//               ),
//             )
//           ],
//
//         ),
//       ),
//     );
//   }
// }
