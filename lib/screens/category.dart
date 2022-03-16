import 'package:flutter/material.dart';
import 'package:le_cube/commons/constants.dart';

import 'package:le_cube/commons/constants.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  _categoryPageState createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: blueBackground,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 35, width: double.infinity,),
                      Text(
                        'CATEGORIES',
                        style: textStyle.copyWith(fontSize: 40, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ]
                  )
                ),
                const SizedBox(height: 20),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage1(icon: Icons.account_balance, title: 'BANQUE'),
                                const SizedBox(width: 20),
                                categoryElementPage1(icon: Icons.architecture, title: 'ARCHITECTURE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage1(icon: Icons.attach_file, title: 'FICHIERS'),
                                const SizedBox(width: 20),
                                categoryElementPage1(icon: Icons.music_note_rounded, title: 'MUSIQUE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          const Divider(thickness: 2),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              categoryElementPage2(icon: Icons.account_balance, title: 'BANQUE'),
                              const SizedBox(height: 15),
                              categoryElementPage2(icon: Icons.architecture, title: 'ARCHITECTURE'),
                              const SizedBox(height: 15),
                              categoryElementPage2(icon: Icons.attach_file, title: 'FICHIERS'),
                              const SizedBox(height: 15),
                              categoryElementPage2(icon: Icons.music_note_rounded, title: 'MUSIQUE')
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  )
              ],
            ),
          );
        }
        )
    );
  }
}
