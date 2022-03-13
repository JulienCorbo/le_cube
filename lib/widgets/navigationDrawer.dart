import 'package:flutter/material.dart';

import 'package:le_cube/screens/homePage.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
          color: Colors.white,
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(height: 48,),
              buildMenuItem(
                  text: 'Accueil',
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 0)
              ),
              const SizedBox(height: 16,),
              buildMenuItem(
                  text: 'Partager une ressource',
                  icon: Icons.keyboard_arrow_right,
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
    final color = Colors.black;
    final hoverColor = Colors.grey;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => homePage()
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => homePage()
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => homePage()
        ));
    }
  }
}

