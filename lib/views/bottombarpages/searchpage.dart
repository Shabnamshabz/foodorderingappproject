import 'package:flutter/material.dart';


import '../../Common widgets/cardwidget.dart';
class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:Card(
            child: TextField(
            decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
                hintText: "Search",
                suffixIcon: Icon(Icons.camera)
                ),
                    ),
          ),),

      ),
    );
  }
}
