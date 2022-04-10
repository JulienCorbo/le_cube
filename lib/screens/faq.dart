import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';

class faq extends StatefulWidget {
  const faq({Key? key}) : super(key: key);

  @override
  _faqState createState() => _faqState();
}

class _faqState extends State<faq> {
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
                              "F.A.Q",
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
                  ],
                ),
              );
            }
        )
    );
  }
}
