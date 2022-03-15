import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:share_plus/share_plus.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';

class addRessource extends StatefulWidget {
  const addRessource({Key? key}) : super(key: key);

  @override
  _addRessourceState createState() => _addRessourceState();
}

class _addRessourceState extends State<addRessource> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        endDrawer: NavigationDrawerWidget(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/hand_fond.png'),
                              fit: BoxFit.cover
                          )
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
                          Text(
                            "Partager\n vos ressources\n facilement !",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: GoogleFonts.zenKurenaido(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                              style: buttonWhite,
                              onPressed: _shareContent,
                              child: const Text('PARTAGER')
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: blueBackground,
                    ),
                    child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "AJOUT D'UNE RESSOURCE",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: GoogleFonts.zenKurenaido(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                              style: buttonWhite,
                              onPressed: (){},
                              child: const Text('Ajouter'),

                          ),
                        ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "BESOIN D'AIDE ?\n VOUS AVEZ UNE QUESTION ?",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.zenKurenaido(
                      textStyle: const TextStyle(
                        color: blueText,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      style: buttonBlue,
                      onPressed: () {} ,
                      child: const Text('SOUMETTRE UNE DEMANDE')
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        )
    );
  }
}
