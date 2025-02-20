import 'package:flutter/material.dart';
class Cardwidget extends StatelessWidget {
  String textname;
  String? subtitlename;
  String imageurl;
  void Function()? ontapfunction;
  Cardwidget({
    required this.textname,required this.imageurl,this.ontapfunction,this.subtitlename
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapfunction,
      child: Container(
        //color: Colors.purpleAccent,
        height: 165,
        child: Card(
          color: Colors.white54,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textname,style: Theme.of(context).textTheme.displayMedium,),
                    //Text(subtitlename!,style: Theme.of(context).textTheme.displayMedium,),
                  ],
                ),
                Container(width: 85,
                    child: Image(image: NetworkImage(imageurl)))

              ]),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),


        ),
      ),
    );
  }
}