import 'package:api_project_shopping_app/Repository/authenticationrepository.dart';
import 'package:api_project_shopping_app/modal/usermodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Common widgets/custom_button.dart';
import '../application_ui_page/applicationfirstpage.dart';
import '../registerpages/registrationpage.dart';

class Loginsignuppage extends StatelessWidget {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  Loginsignuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("LOGIN",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 50)),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: mailcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter you email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter you password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                    onPressed: () async{
                      AuthenticationRepository abc=AuthenticationRepository();
                      bool status=await abc.login(mailcontroller.text, passwordcontroller.text);
                      if(status==true) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Userloginfirstpage()),
                          (route) => false,
                        );
                      }

                    },
                    child: Text("Login")),

                // FilledButton(onPressed: (){}, child: Text("LOGIN")),
                SizedBox(
                  height: 22,
                ),
                Text("if not registered kindly register by sign up"),
                SizedBox(
                  height: 12,
                ),
                FilledButton(
                  child: Text("Register"),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Registrationpage(),));
                  }
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// try {
// await FirebaseAuth.instance.signInWithEmailAndPassword(
// email: usernamecontroller.text,
// password: passwordcontroller
//     .text); //as we are using await keyword before this firebase.authentication code, the next line of codes underneath await,that will only execute if this line of code executes without any eror, if else it will move on to catch and execute that line of code
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => Registrationpage(),
// ),
// );
// } catch (error) {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text(error.toString())));
//}
