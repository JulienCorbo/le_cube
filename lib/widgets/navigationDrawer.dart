import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/screens/homePage.dart';
import 'package:le_cube/screens/category.dart';
import '../screens/addRessource.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))
          ),
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
                  text: 'CATEGORIES',
                  icon: Icons.keyboard_arrow_right,
                  onClicked: () => selectedItem(context, 2)
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                  text: 'F.A.Q',
                  icon: Icons.keyboard_arrow_right,
                  onClicked: () => selectedItem(context, 3)
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
    const color = blueText;
    const hoverColor = Colors.grey;
    return ListTile(
      leading: Icon(icon, color: color),
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
            builder: (context) => const addRessource()
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const categoryPage()
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const homePage()
        ));
    }
  }
}

