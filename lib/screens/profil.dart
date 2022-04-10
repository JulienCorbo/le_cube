import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';
import 'package:le_cube/screens/homePage.dart';
import 'package:le_cube/screens/login.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        endDrawer: NavigationDrawerWidget(),
        backgroundColor: whiteBackground,
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
                            SizedBox(height: 20),
                            Text(
                              "PROFIL",
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
                                Text(
                                    'NOM DU PROFIL',
                                  style: textStyle.copyWith(fontSize: 25),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                            "34",
                                          style: textStyle.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "RESSOURCES\nPARTAGÉES",
                                          style: textStyle.copyWith(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 40),
                                    Column(
                                      children: [
                                        Text(
                                          "12",
                                          style: textStyle.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "RESSOURCES\nEN FAVORIS",
                                          style: textStyle.copyWith(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 16),
                                Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      const Divider(thickness: 2, color: blueBackground),
                                      Text("Liste des ressources partagées ?", style: textStyle),
                                      const Divider(thickness: 2, color: blueBackground),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                                ElevatedButton(
                                    style: buttonWhite,
                                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const Login()
                                    )),
                                    child: const Text('SE DÉCONNECTER')
                                ),
                                SizedBox(height: 30),
                              ],
                            )
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
