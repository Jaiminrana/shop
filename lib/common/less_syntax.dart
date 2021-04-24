import 'package:flutter/material.dart';

const Color deeporange=Colors.deepOrange;
const Color black=Colors.black;
const Color white=Colors.white;
const Color grey=Colors.grey;
const Color primary = Colors.deepOrange;
const  red = Colors.red;
const  yellow = Colors.yellow; 
const Color green = Colors.green;
 
//method
void changeScreen(BuildContext context,Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}


void changeScreenReplacement(BuildContext context,Widget widget){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget));
}