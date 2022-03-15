import 'package:flutter/material.dart';
import 'package:le_cube/screens/addRessource.dart';

import 'package:le_cube/screens/login.dart';
import 'package:le_cube/screens/homePage.dart';
import 'package:le_cube/screens/splash_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
