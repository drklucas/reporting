import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size; 
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 249, 249, 249),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity, 
                height: _size.height * 0.25,
                color: Colors.black,
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
