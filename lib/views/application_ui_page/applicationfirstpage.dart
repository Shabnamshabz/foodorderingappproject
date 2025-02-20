import "package:flutter/material.dart";

import "../bottombarpages/accountpage.dart";
import "../bottombarpages/cartpage.dart";
import "../bottombarpages/favouritespage.dart";
import "../bottombarpages/homepage.dart";
import "../bottombarpages/searchpage.dart";
class Userloginfirstpage extends StatefulWidget {
  const Userloginfirstpage({super.key});

  @override
  State<Userloginfirstpage> createState() => _UserloginfirstpageState();
}

class _UserloginfirstpageState extends State<Userloginfirstpage> {
  List<Widget> Pages=[Homepage(),Accountpage(),Cartpage(),Favouritespage()];
  int index=0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Pages[index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
            showUnselectedLabels: false,
            currentIndex: index,
            onTap: (value){
              setState(() {
                index=value;
              });
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,

            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.person,),label: "Account"),
          BottomNavigationBarItem(icon:Icon(Icons.shopping_cart,),label: "Cart"),
          BottomNavigationBarItem(icon:Icon(Icons.favorite,),label: "Favourites"),
        ]
            ),
      ),


    );
  }
}
