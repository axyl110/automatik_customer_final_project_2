import 'dart:developer';
import 'package:flutter/material.dart';
import 'services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Hello Appbar"),
      //   leading: GestureDetector(
      //     onTap: () {/* Write listener code here */},
      //     child: Icon(
      //       Icons.menu, // add custom icons also
      //     ),
      //   ),
      // ),
      body: Container(
        child: Services(),
      ),
    );
  }
}
