
import "package:api_project_shopping_app/Service/localrepositorysharedpreference.dart";
import "package:api_project_shopping_app/views/Loginpages/loginpage.dart";
import "package:flutter/material.dart";

import "../application_ui_page/applicationfirstpage.dart";
import "on_boarding_screen.dart";


class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    //to navigate to loginpage
    // Future.delayed(
    //   Duration(seconds: 4),
    //   () => Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => LoginPage(),
    //     ),
    //     (route) => false,
    //   ),
    // );

    //to navigate to login page/homepage
    Future.delayed(
      Duration(seconds: 7),
          () async{
            Localrepository token=Localrepository();
            String? usertoken=await token.getlogintoken();
            if(usertoken!=null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>Userloginfirstpage(),
                ),
                    (route) => false,
              );
            }

        else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Loginsignuppage(),
            ),
                (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Image(image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.ICJ0udZ_QT-mFMvriLbTiAHaFj&pid=Api&P=0&h=220"),fit: BoxFit.cover,),
        //COPY WITH METHOD: MAKING CHANGES TO THE EXISTING SET OF DATA,
        // so, you can add the alteration directly to the theme by
        // titlelarge. <code>
      ),
    );
  }
}
