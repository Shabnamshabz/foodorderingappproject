import 'package:flutter/material.dart';

class Accountpaymentpage extends StatelessWidget {
  const Accountpaymentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREDIT CARD / DEBIT CARD DETAILS",style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 22,),
          Text("Card number",style: Theme.of(context).textTheme.displayMedium,),
            SizedBox(height: 5,)
        ,TextField(
        decoration: InputDecoration(
          hintText: "Enter Card Number",
          suffixIcon: Icon(Icons.credit_card),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),),
            SizedBox(height: 22,),
            Text("Date of Expiry",style: Theme.of(context).textTheme.displayMedium,),
            SizedBox(height: 5,)
            ,TextField(
              onTap: () async{
                var date= await showDatePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime.now());
              },
              decoration: InputDecoration(
                hintText: "Enter Card Number",
                suffixIcon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            SizedBox(height: 22,),
            Text("Name on card",style: Theme.of(context).textTheme.displayMedium,),
        SizedBox(height: 5,)
            ,TextField(
              decoration: InputDecoration(
                hintText: "Enter name on card",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(width:double.infinity,child: FilledButton(onPressed: (){}, child: Text("Save card"))),
            )
          ],
        ),
      )
    );
  }
}
