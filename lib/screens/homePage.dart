import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
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
                              style: ElevatedButton.styleFrom(
                                  textStyle: GoogleFonts.zenKurenaido(
                                  textStyle: const TextStyle(fontSize: 23),
                                  ),
                                  primary: Colors.white,
                                  onPrimary: bleu_txt,
                                  fixedSize: const Size(250, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                              onPressed: () {} ,
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
                    decoration: BoxDecoration(
                      color: bleu_fond,
                    ),
                    child: Column(
                        children: [
                          Text(
                            "A LA UNE",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: GoogleFonts.zenKurenaido(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "BESOIN D'AIDE ?\n VOUS AVEZ UNE QUESTION ?",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.zenKurenaido(
                      textStyle: const TextStyle(
                        color: bleu_txt,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: GoogleFonts.zenKurenaido(
                              textStyle: const TextStyle(fontSize: 17)
                          ),
                          primary: bleu_btn,
                          onPrimary: Colors.white,
                          fixedSize: const Size(250, 50),
                          side: const BorderSide(color: Colors.white, width: 0.7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
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
