import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/screens/homePage.dart';

import '../screens/addRessource.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
          color: blueBackground,
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 64,),
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 200,
              ),
              const SizedBox(height: 48,),
              buildMenuItem(
                  text: 'ACCUEIL',
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 0)
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                  text: 'AJOUTER UNE RESSOURCE',
                  icon: Icons.add ,
                  onClicked: () => selectedItem(context, 1)
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                  text: 'F.A.Q',
                  icon: Icons.keyboard_arrow_right,
                  onClicked: () => selectedItem(context, 2)
              ),
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
    final color = blueText;
    final hoverColor = Colors.grey;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
          text,
          style: GoogleFonts.zenKurenaido(
              textStyle: const TextStyle(
                  fontSize: 14,
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
            builder: (context) => const addRessource()
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const homePage()
        ));
    }
  }
}

