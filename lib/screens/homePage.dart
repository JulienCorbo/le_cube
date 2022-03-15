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
        backgroundColor: whiteBackground,
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
                      color: blueBackground,
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
                                spotlightElement(title: 'Comment demander un prêt bancaire ?',category: 'BANQUE', icon: Icons.account_balance),
                                spotlightElement(title: '', category: 'ARCHITECTURE', icon: Icons.architecture),
                                spotlightElement(title: 'Lettre préavis pré-remplie', category: 'FICHIERS', icon: Icons.attach_file)
                              ],
                              options: CarouselOptions(
                                  initialPage: 0,
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
                      constraints: const BoxConstraints(maxHeight: double.infinity),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                      color: blueBackground,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 200,
                          width: 380,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/pres_RR.jpg'),
                              fit: BoxFit.fill,
                            ),
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
                          "CATÉGORIE A LA UNE",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: GoogleFonts.zenKurenaido(
                            textStyle: const TextStyle(
                              color: blueText,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CarouselSlider(
                          items: [
                            categoryElement(icon: Icons.account_balance, categoryTitle: 'BANQUE', nbrRessource: '25'),
                            categoryElement(icon: Icons.architecture, categoryTitle: 'ARCHITECTURE', nbrRessource: '17'),
                            categoryElement(icon: Icons.attach_file, categoryTitle: 'FICHIERS', nbrRessource: '34'),
                          ],
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              height: 400
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            style: buttonBlue,
                            onPressed: () {} ,
                            child: const Text('PLUS DE CATÉGORIES')
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
                              color: blueText,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                            style: buttonBlue,
                            onPressed: () {} ,
                            child: const Text('SOUMETTRE UNE DEMANDE')
                        ),
                        const SizedBox(height: 20),
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
