import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';
import 'package:le_cube/screens/login.dart';
import 'package:le_cube/utils/userInfo.dart';



class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  String token = '';
  String email = '';
  String firstname = '';
  String lastname = '';
  String role = '';
  @override
  void initState() {
    super.initState();
    token = UserInfo.getUserToken();
    email = UserInfo.getUserEmail();
    firstname = UserInfo.getUserFirstname();
    lastname = UserInfo.getUserLastname();
    role = UserInfo.getUserRole();

  }
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        endDrawer: NavigationDrawerWidget(),
        backgroundColor: blueBackground,
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
                                  (firstname + ' ' + lastname).toUpperCase(),
                                  style: textStyle.copyWith(fontSize: 25, color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Mail : ',
                                      style: textStyle.copyWith(fontSize: 23, color: Colors.white),
                                    ),
                                    Text(
                                      email,
                                      style: textStyle.copyWith(fontSize: 23, color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rôle : ',
                                      style: textStyle.copyWith(fontSize: 23, color: Colors.white),
                                    ),
                                    Text(
                                      role,
                                      style: textStyle.copyWith(fontSize: 23, color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 40),
                                ElevatedButton(
                                    style: buttonWhite,
                                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const Login()
                                    )),
                                    child: const Text('SE DÉCONNECTER')
                                ),
                                const SizedBox(height: 30),
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
