import 'package:flutter/material.dart';

showsnack(context, String text){
  var snackBar =  SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'ok', onPressed: () {  },
      ));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

homeButton(width,height,String text){
  return Container(
    width: width*.8,
    height: height*.08,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child:  Text(text,style: TextStyle(color:Color(0xff6c63ff),fontWeight: FontWeight.bold,fontSize: width*.046
      ),),
    ),
  );
}