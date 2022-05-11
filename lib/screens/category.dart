import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigation_drawer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const NavigationDrawerWidget(),
        backgroundColor: whiteBackground,
        key: _globalKey,
        body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/hand_fond.png'),
                              fit: BoxFit.cover
                          ),
                          border: Border(bottom: BorderSide(color: blueBorder, width:4 ))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _globalKey.currentState?.openEndDrawer();
                                  },
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  )
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "CATEGORIES",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: GoogleFonts.zenKurenaido(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
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
                                categoryElementPage(icon: FontAwesomeIcons.creditCard, title: 'BANQUE'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: FontAwesomeIcons.draftingCompass, title: 'ARCHITECTURE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: FontAwesomeIcons.paperclip, title: 'FICHIERS'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: FontAwesomeIcons.music, title: 'MUSIQUE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: FontAwesomeIcons.book, title: 'LITTÉRATURE'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: FontAwesomeIcons.theaterMasks, title: 'CULTURE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: FontAwesomeIcons.atom, title: 'SCIENCE'),
                                const SizedBox(width: 20),
                                categoryElementPage(icon: FontAwesomeIcons.robot, title: 'JEUNESSE')
                              ]
                          ),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                categoryElementPage(icon: FontAwesomeIcons.robot, title: 'HISTOIRE'),
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
