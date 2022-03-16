import 'package:flutter/material.dart';

import 'package:le_cube/commons/constants.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  _categoryPageState createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: blueBackground,
                  ),
                  child: Text(
                      'CATEGORIES',
                    style: textStyle.copyWith(fontSize: 40, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        }
        )
    );
  }
}
