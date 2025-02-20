import 'package:api_project_shopping_app/Repository/authenticationrepository.dart';
import 'package:api_project_shopping_app/Service/localrepositorysharedpreference.dart';
import 'package:api_project_shopping_app/provider/fooditemprovider.dart';
import 'package:api_project_shopping_app/views/Loginpages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Common widgets/cardwidget.dart';
import '../../Common widgets/gridimagewidget.dart';
import '../../Common widgets/iconcardwidget.dart';
import '../Productsdisplay/categorypage.dart';
import 'cartpage.dart';
import 'favouritespage.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 125,),
            FilledButton(onPressed: ()async{
              AuthenticationRepository abc=AuthenticationRepository();
              bool status=await abc.signout();
              if(status==true)
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Loginsignuppage(),), (route) => false,);
                }
            }, child: Text("Signout"))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Grab the food!",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.green[800],
                fontSize: 35,
                fontFamily: "serif",
                fontWeight: FontWeight.bold)),
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Favouritespage(),
                    ));
              },
              icon: Icon(Icons.favorite)),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cartpage(),));
          }, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                           "https://tse3.mm.bing.net/th?id=OIP.8imhMi88x0OpPjZJLX80qwHaGQ&pid=Api&P=0&h=220")),
                  ),
                ),
                Expanded(
                  child: Consumer<Fooditemprovider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return GridView.builder(
                        itemCount: value.Categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Categorypage(
                                    Categid: value.Categories[index].categoryId, // Pass correct categoryId
                                  ),
                                ),
                              );
                            },
                            child: iconcardwidget(
                              iconname: value.Categories[index].categoryName,
                              Imageurl: value.Categories[index].categoryImage,
                              colourname: Colors.purpleAccent,
                            ),
                          );
                        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      );
                    },
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


