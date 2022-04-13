import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:le_cube/screens/login.dart';
import 'package:le_cube/utils/userInfo.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await UserInfo.init();
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
      home: const Login(),
    );
  }
}
