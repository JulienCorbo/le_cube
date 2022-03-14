import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        backgroundColor: blanc_fond,
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
                    decoration: const BoxDecoration(
                      color: bleu_fond,
                    ),
                    child: Column(
                        children: [
                          SizedBox(height: 10),
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
                          const SizedBox(height: 10),
                          CarouselSlider(
                              items: [
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        'TITRE 1',
                                        style: GoogleFonts.zenKurenaido(
                                          textStyle: const TextStyle(
                                            color: bleu_txt,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        'TITRE 2',
                                        style: GoogleFonts.zenKurenaido(
                                          textStyle: const TextStyle(
                                            color: bleu_txt,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        'TITRE 3',
                                        style: GoogleFonts.zenKurenaido(
                                          textStyle: const TextStyle(
                                            color: bleu_txt,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                height: 400
                              ),
                          )
                        ]
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                      alignment: Alignment.center,
                      constraints: BoxConstraints(maxHeight: double.infinity),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                      color: bleu_fond,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text( "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nec euismod eros. Sed interdum orci lacus, vitae facilisis augue laoreet in. Suspendisse sit amet orci mauris. Duis rutrum consectetur nulla, sit amet pharetra nibh rhoncus at. Sed auctor auctor blandit. Maecenas consectetur dignissim tempus. Donec sed efficitur purus. Vestibulum accumsan sem mauris, sed posuere sem malesuada sed. Vestibulum dapibus posuere sem sit amet rutrum. Sed pellentesque leo vitae dolor cursus, vitae iaculis metus auctor.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.zenKurenaido(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    )
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "SELECTIONNER UNE CATEGORIE",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: GoogleFonts.zenKurenaido(
                            textStyle: const TextStyle(
                              color: bleu_txt,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CarouselSlider(
                          items: [
                            Container(
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    'CATEGORIE 1',
                                    style: GoogleFonts.zenKurenaido(
                                      textStyle: const TextStyle(
                                        color: bleu_txt,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    'CATEGORIE 2',
                                    style: GoogleFonts.zenKurenaido(
                                      textStyle: const TextStyle(
                                        color: bleu_txt,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    'CATEGORIE 3',
                                    style: GoogleFonts.zenKurenaido(
                                      textStyle: const TextStyle(
                                        color: bleu_txt,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              height: 400
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: GoogleFonts.zenKurenaido(
                                    textStyle: const TextStyle(fontSize: 19)
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
                            child: const Text('VOIR PLUS')
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "BESOIN D'AIDE ?\n VOUS AVEZ UNE QUESTION ?",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: GoogleFonts.zenKurenaido(
                            textStyle: const TextStyle(
                              color: bleu_txt,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: GoogleFonts.zenKurenaido(
                                    textStyle: const TextStyle(fontSize: 19)
                                ),
                                primary: bleu_btn,
                                onPrimary: Colors.white,
                                fixedSize: const Size(300, 60),
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
                  )
                ],
              ),
            );
            },
        )
    );
  }
}
