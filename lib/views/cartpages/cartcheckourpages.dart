import 'package:api_project_shopping_app/views/cartpages/orderconfirmation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cartprovider.dart';
class Checkoutpage extends StatelessWidget {
  TextEditingController cardnumbercontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController cvvcontroller = TextEditingController();
  Checkoutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                "Payment Page",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              )),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 22,
          ),
          const Text(
            "Card number",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Card Number",
              suffixIcon:
              const Icon(Icons.credit_card),
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5)),
            ),
            controller: cardnumbercontroller,
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            "Date of Expiry",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: datecontroller,
            onTap: () async {
              // var date= await showDatePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime.now());
            },
            decoration: InputDecoration(
              hintText: "Enter Card Number",
              suffixIcon:
              const Icon(Icons.calendar_month),
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5)),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const Text("cvv code",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: cvvcontroller,
            decoration: InputDecoration(
              hintText: "Enter name on card",
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5)),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () {
                      context.read<Cartprovider>().addpayment(
                          cardnumbercontroller.text,
                          datecontroller.text,
                          cvvcontroller.text);
                      Navigator.push(context,MaterialPageRoute(builder:(context) => Orderconfirmation(),));

                    },
                    child: const Text("Confirm Payment"))),
          )
        ],
      ),

    );
  }
}

