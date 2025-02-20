import 'package:api_project_shopping_app/provider/cartprovider.dart';
import 'package:api_project_shopping_app/provider/fooditemprovider.dart';
import 'package:api_project_shopping_app/provider/on_boarding_provider.dart';
import 'package:api_project_shopping_app/views/FIrstPages/splashpagelogo.dart';
import 'package:api_project_shopping_app/views/Loginpages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => OnBoardingProvider(),
          ),
          ChangeNotifierProvider(create: (context) => Fooditemprovider(),),
          ChangeNotifierProvider(create: (context) => Cartprovider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                displayMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                displaySmall: TextStyle(
                  fontSize: 10,
                )),
          ),

          //home: Splashpage(),
          //home:ProductDisplayMainPage(),
          home: Splashpage(),
          //home: Fullproductdisplay(),
          //home: Orderfulldisplay(),
          //home:Cartpage(),
          //home: Producttofirebase(),
        ));
  }
}


