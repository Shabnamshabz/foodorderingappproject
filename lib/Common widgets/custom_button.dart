import 'dart:ui';

import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  VoidCallback onTapfunction;
  String text;
  CustomButton({required this.text,required this.onTapfunction,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapfunction,
    child: Container(
      child: Center(child: Text(text,style: Theme.of(context).textTheme.titleLarge,)),width:double.infinity,height: 50,decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: LinearGradient(colors: [Colors.blue,Colors.pink,Colors.purple] ),
    boxShadow: [BoxShadow(color: Colors.grey,spreadRadius:5,blurRadius: 10),]
    ),),
    );
  }
}
