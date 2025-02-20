import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Accountslogoutpage extends StatelessWidget {
  const Accountslogoutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Accounts",style: Theme.of(context).textTheme.displayLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 22,),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.gift,color: Colors.brown,),
                  title: Text("Gift cards and vouchers",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),

              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.help,color: Colors.brown,),
                  title: Text("Need help?",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),

              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.shopping_cart_checkout,color: Colors.brown,),
                  title: Text("Tell us what you think about this?",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),

              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.logout,color: Colors.brown,),
                  title: Text("Log Out",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
