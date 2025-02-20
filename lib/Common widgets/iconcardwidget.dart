import 'package:flutter/material.dart';

class iconcardwidget extends StatelessWidget {
  String Imageurl;
  String iconname;
  Color colourname;
  void Function()? onpressedfunction;
   iconcardwidget({
    super.key,
    required this.iconname,required this.colourname,required this.Imageurl,this.onpressedfunction
  });
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressedfunction,
      child: Card(
        color: Colors.white54,
        child: Container(
            width: 400,
            height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 10,),
              Expanded(child: Image(image: NetworkImage(Imageurl),fit: BoxFit.fitWidth,)),
        
              Center(
                  child: Text(
                    iconname,
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
