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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavigationDrawerWidget(),
        backgroundColor: whiteBackground,
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
                                'PROFIL',
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
