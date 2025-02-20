import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Common widgets/On_boarding_model.dart';
import '../Loginpages/loginpage.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(
      Duration(seconds: 4),
      (timer) {

        if(currentvariable==2)
          {

            controller.jumpToPage(
                currentvariable);
            currentvariable=-1;

          }

        currentvariable++;
        controller.jumpToPage(
            currentvariable);
        //move to next page aftre two swcond
        // if(currentvariable==2)
        // {
        //   currentvariable=0;
        // }
      },
    ); //
    super.initState();
  }

  PageController controller = PageController();
  int currentvariable = 0;
  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> collection = [
      OnBoardingModel(
          image:
              "https://tse3.mm.bing.net/th?id=OIP.XssBxpt1tkN2VxtoFBjsoQHaEn&pid=Api&P=0&h=220",
          title: "View product 360 degree",
          subtitle:
              "you can see the fooditems in all angle, with true and convenient"),
      OnBoardingModel(
          image:
          "https://tse1.mm.bing.net/th?id=OIP.ulnp3XchwkjvUAIvlmE-fwHaGv&pid=Api&P=0&h=220",
          title: "View product easily",
          subtitle:
              "you can view easily"),
      OnBoardingModel(
          image:
              "https://tse2.mm.bing.net/th?id=OIP.6NLwLqJ8SsIoAZWTTBFZkAHaIO&pid=Api&P=0&h=220",
          title: "Payment is easy",
          subtitle: "you can easily do online payment to order food")
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Text(
                    "Grab the food you like now!",textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 38),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                child: PageView.builder(
                  controller:
                  controller, //to automatically move on each screen use controller
                  onPageChanged: (value) {
                    setState(() {
                      currentvariable = value;
                    });
                  }, // extra property of pageview builder, to get the existing page index value, to get index value globally
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: NetworkImage(collection[index].image),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.40,
                            fit: BoxFit.fitWidth,
                          ),
                          Center(
                            child: Text(
                              collection[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.green[800]),
                            ),
                          ),
                          Center(
                            child: Text(
                              collection[index].subtitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.green[800]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: currentvariable == index ? 30 : 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: currentvariable == index
                                  ? Colors.blue
                                  : Colors.grey,
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.black)),
                        ),
                      );
                    },
                  )),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () {
                      timer?.cancel();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginsignuppage(),
                          ));
                    },
                    child: Text(
                      "Get Started!",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        WidgetStatePropertyAll(Colors.green))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
