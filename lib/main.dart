import 'package:flutter/material.dart';

import 'package:le_cube/screens/login.dart';
import 'package:le_cube/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RR',
      theme: ThemeData(
        //canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: const homePage(),
    );
  }
}
