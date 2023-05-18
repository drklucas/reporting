import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  Error error; 
   ErrorScreen(this.error, { Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Container(
            child: Center(
              child: Text(error.toString()), 
            ),
           ),
       );
  }
}