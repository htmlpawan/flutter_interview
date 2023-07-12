import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54, //change your color here
        ),
          title: const Text("Mydocmate",
              style: TextStyle(
              color: Color(0xff7f8ec9), fontWeight: FontWeight.w800,fontSize: 25)),
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
        );
      
  }
}