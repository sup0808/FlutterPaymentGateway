import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpiIndiaScreen extends StatefulWidget{
  @override
  State<UpiIndiaScreen> createState() => _UpiIndiaScreenState();
}

class _UpiIndiaScreenState extends State<UpiIndiaScreen> {
  @override
  Widget build(BuildContext context) {
   return Center(
     child: OutlinedButton(
       child: Text("UPI India"),
       onPressed: (){

       },
     ),
   );
  }
}