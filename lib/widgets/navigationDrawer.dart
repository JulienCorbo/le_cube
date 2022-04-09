import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/screens/homePage.dart';
import 'package:le_cube/screens/category.dart';
import 'package:le_cube/screens/profil.dart';
import '../screens/addRessource.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
          shape: const RoundedRectangleBorder(
          ),
          color: blueBackground,
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 64,),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const homePage()
                )),
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                  height: 200,
                ),
              ),
              const SizedBox(height: 48),
              buildMenuItem(
                  text: 'ACCUEIL',
                  icon: FontAwesomeIcons.home,
                  onClicked: () => selectedItem(context, 0)
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                  text: 'PROFIL',
                  icon: FontAwesomeIcons.user,
                  onClicked: () => selectedItem(context, 1)
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                  text: 'AJOUTER UNE RESSOURCE',
                  icon: FontAwesomeIcons.plus ,
                  onClicked: () => selectedItem(context, 2)
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                  text: 'CATEGORIES',
                  icon: FontAwesomeIcons.arrowRight,
                  onClicked: () => selectedItem(context, 3)
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                  text: 'F.A.Q',
                  icon: FontAwesomeIcons.question,
                  onClicked: () => selectedItem(context, 4)
              ),
              const SizedBox(height: 32),
              const Divider(thickness: 2, color: Colors.white),
              const SizedBox(height: 32),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 28,
                      )
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 28,
                      )
                  ),
                  SizedBox(width: 20),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 28,
                      )
                  ),
                  SizedBox(width: 20),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        Icons.mail,
                        color: Colors.white,
                        size: 28,
                      )
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = blueText;
    const hoverColor = Colors.grey;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 20,
      ),
      title: Text(
          text,
          style: GoogleFonts.zenKurenaido(
              textStyle: const TextStyle(
                  fontSize: 15,
                  color: blueText
              )
          ),
      ),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const homePage()
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const profil()
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const addRessource()
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const categoryPage()
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const homePage()
        ));
        break;
    }
  }
}

