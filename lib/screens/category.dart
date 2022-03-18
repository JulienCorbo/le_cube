import 'package:flutter/material.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';
import 'package:le_cube/screens/homePage.dart';

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
        endDrawer: NavigationDrawerWidget(),
        backgroundColor: whiteBackground,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const homePage()
                            ));
                            },
                          icon: const Icon(
                              Icons.keyboard_arrow_left,
                            size: 40.0,
                            color: Colors.white,
                          )
                      ),
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
                                categoryElementPage(icon: Icons.account_balance_rounded, title: 'BANQUE'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: Icons.architecture, title: 'ARCHITECTURE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: Icons.attach_file, title: 'FICHIERS'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: Icons.music_note_rounded, title: 'MUSIQUE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: Icons.menu_book_rounded , title: 'LITTÉRATURE'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: Icons.theater_comedy , title: 'CULTURE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: Icons.science_rounded , title: 'SCIENCE'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: Icons.skateboarding_rounded , title: 'JEUNESSE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: Icons.military_tech_rounded , title: 'HISTOIRE'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: Icons.park_rounded , title: 'NATURE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: Icons.military_tech_rounded , title: 'HISTOIRE'),
                              ]
                          ),
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
