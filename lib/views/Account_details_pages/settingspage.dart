import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SETTINGS",style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.globe,color: Colors.brown,),
                  title: Text("Shop in",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.photo_size_select_large,color: Colors.brown,),
                  title: Text("Sizes",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.bell_fill,color: Colors.brown,),
                  title: Text("Notification",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.menu_book_sharp,color: Colors.brown,),
                  title: Text("Face id",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.home,color: Colors.brown,),
                  title: Text("Shop",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.screenshot_outlined,color: Colors.brown,),
                  title: Text("Screenshot",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.lock,color: Colors.brown,),
                  title: Text("Terms and Condition",style: Theme.of(context).textTheme.displayMedium),
                  trailing: IconButton(onPressed: (){},icon:Icon(Icons.arrow_forward_ios_rounded),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
