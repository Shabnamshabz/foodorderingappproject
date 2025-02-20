
import 'package:api_project_shopping_app/Repository/authenticationrepository.dart';
import 'package:api_project_shopping_app/modal/usermodal.dart';
import 'package:flutter/material.dart';

import '../../Common widgets/TextFieldModalClass.dart';
import '../../Common widgets/custom_button.dart';
import '../../Common widgets/dateformat.dart';


class Registrationpage extends StatefulWidget {
  Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  AuthenticationRepository XYZ=AuthenticationRepository();
  TextEditingController namecontroller = TextEditingController();

  TextEditingController mailcontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();
  TextEditingController phnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up Form",
              style: Theme.of(context).textTheme.displayLarge),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Name",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    name: "Enter your name", controller: namecontroller),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Email Address",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    name: "Enter your email", controller: mailcontroller),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    name: "Enter your password", controller: passcontroller),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Phone Number:",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                TextfieldWidget(
                    name: "Enter your Phone number", controller: phnocontroller),
                SizedBox(
                  height: 16,
                ),

                CustomButton(
                    text: "SUBMIT",
                    onTapfunction: ()  {
                      XYZ.register(UserModal(customerName: namecontroller.text,customerEmail: mailcontroller.text,customerPass: passcontroller.text,customerPhno: phnocontroller.text));
                      Navigator.pop(context);
                    })
              ]),
        )));
  }
}
