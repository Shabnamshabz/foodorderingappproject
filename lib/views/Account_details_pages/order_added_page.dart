import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
class OrderAddedPage extends StatefulWidget {

  OrderAddedPage({super.key});

  @override
  State<OrderAddedPage> createState() => _OrderAddedPageState();
}

class _OrderAddedPageState extends State<OrderAddedPage> {
  int current_step = 0;

  List<Step> steps = [
    Step(
      title: Text("Placed order",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      content: Text("8th june 2024,8:40am",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      isActive: true,
    ),
    Step(
      title: Text('Delivered to shipping UNIT',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      content: Text("9th june 2024,8:40am",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      isActive: true,
    ),
    Step(
      title: Text('Orders are being shipped',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      content: Text("10th june 2024,8:40am",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int activeStep=0;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text("My Orders",style: Theme.of(context).textTheme.displayLarge,),
      actions: [
        IconButton(onPressed:(){} , icon:Icon(Icons.search)),
        IconButton(onPressed:(){} , icon:Icon(Icons.shopping_cart)),
      ],
       ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            TabBar(
                padding: EdgeInsets.all(10),
                dividerHeight: 2,
                dividerColor: Colors.blue,
                indicatorColor: Colors.red,
                labelColor: Colors.blue,
                labelStyle:Theme.of(context).textTheme.displayMedium,

                tabs: [Text("Pending Orders"),Text("Past Orders")]),
            Expanded(
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: TabBarView(children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          child: ListTile(
                            leading: Image(image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.cjLGdnddziH-G0hmyRnb6wHaHa&pid=Api&P=0&h=220"),fit: BoxFit.cover,),
                            title: Text("Womens Hoodie",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                            trailing:IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward_ios)),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cash on delivery"),
                                Text("123aed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(height:100,),
                Container(
                  child: Stepper(
                    connectorThickness:5,
                    //stepIconWidth: 10,
                    currentStep:current_step,
                    steps: steps,
                    type: StepperType.vertical,
                    onStepTapped: (step) {
                      setState(() {
                        current_step = step;
                      }
                      );
                    },
                    onStepContinue: () {
                      setState(() {
                        if (current_step < steps.length - 1) {
                          current_step = current_step + 1;
                        } else {
                          current_step = 0;
                        }
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        if (current_step > 0) {
                          current_step = current_step - 1;
                        } else {
                          current_step = 0;
                        }
                      });
                    },
                  ),
                ),

                      // const EasyStepper(activeStep:4,
                      //     alignment: Alignment.bottomLeft,
                      //   internalPadding: 5,
                      //     borderThickness: 40,
                      //     showLoadingAnimation: true,
                      //     stepRadius: 25,
                      //     direction: Axis.vertical,
                      //     steps:[
                      //       EasyStep(
                      //
                      //           icon: Icon(CupertinoIcons.cart),
                      //         title: "Placed order",),
                      //       EasyStep(icon: Icon(Icons.home), title:"Delivered to shipping unit",
                      //         lineText: "8th june 2024,8:40am",
                      //       ),
                      //       EasyStep(icon: Icon(Icons.fire_truck_outlined), title:
                      //           "Orders are being shipped",
                      //          lineText:"9th june 2024,8:40am",
                      //
                      //       ),
                      //       EasyStep(icon: Icon(Icons.favorite), title:"Delivered successfully",
                      //           lineText: "not delivered yet",
                      //
                      //       ),
                      //     ],),
                      // Stepper(
                      //
                      //   connectorThickness: 4,
                      //   connectorColor: WidgetStatePropertyAll(Colors.brown),
                      //   //stepIconWidth: 50,
                      //   //currentStep: 2,
                      //   stepIconHeight: 50,
                      //
                      //   type: StepperType.vertical,
                      //   steps: const [
                      //     Step(
                      //         title: Icon(CupertinoIcons.cart), content: Row(
                      //       children: [
                      //         Center(child: Text("Placed order"),),
                      //         Center(child: Text("7th june 2024,8:40am"),),
                      //       ],
                      //     )),
                      //     Step(title: Icon(Icons.home), content: Row(
                      //       children: [
                      //         Center(child: Text("Delivered to shipping unit"),),
                      //         Center(child: Text("8th june 2024,8:40am"),),
                      //       ],
                      //     )),
                      //     Step(title: Icon(Icons.fire_truck_outlined), content: Row(
                      //       children: [
                      //         Center(child: Text("Orders are being shipped"),),
                      //         Center(child: Text("9th june 2024,8:40am"),),
                      //       ],
                      //     )),
                      //     Step(title: Icon(Icons.favorite), content: Row(
                      //       children: [
                      //         Center(child: Text("Delivered successfully"),),
                      //         Center(child: Text("not delivered yet"),),
                      //       ],
                      //     )),
                      //   ],
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          child: ListTile(
                            leading: Image(image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.9Fryy6iOJOnHgkNUZWTF2gAAAA&pid=Api&P=0&h=220"),),
                            title: Text("Mens Track Pants",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                               trailing:IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward_ios)),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cash on delivery"),
                                Text("123aed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ]),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
