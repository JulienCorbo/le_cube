import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:le_cube/screens/FilePickerDemo.dart';

import 'package:share_plus/share_plus.dart';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';

import 'package:file_picker/file_picker.dart';

class addRessource extends StatefulWidget {
  const addRessource({Key? key}) : super(key: key);

  @override
  _addRessourceState createState() => _addRessourceState();
}

class _addRessourceState extends State<addRessource> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  String? dropdownvalue = 'Art';
  var items = [
    'literature',
    'musique',
    'Culture',
    'Jeunesse',
    'Architecture',
    'Science',
    'Nature',
    'Histoire',
    'Banque',
    'Art',
    'Autre'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavigationDrawerWidget(),
        body: LayoutBuilder(
            builder: (BuildContext context,
                BoxConstraints viewportConstraints) {
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
                            Text(
                              'AJOUT RESSOURCE',
                              style: textStyle.copyWith(fontSize: 40, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ]

                      )
                  ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            width: 400,
                            child: Form(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.start,
                                runSpacing: 10,
                                children: <Widget>[
                                  Text(
                                  "Titre de la ressource",
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: textStyle.copyWith(fontSize: 25)
                                  ),
                                TextFormField(
                                  style: textStyle.copyWith(fontSize: 17),
                                  textAlign: TextAlign.center,
                                  decoration: textInputDecoration.copyWith(),
                              ),
                                ]
                              )
                            )
                        ),
                        Text(
                            "Catégorie :",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: textStyle.copyWith(fontSize: 25)
                        ),
                        DropdownButtonFormField(
                          value: dropdownvalue,
                          decoration: textInputDecoration.copyWith(),
                          style: textStyle.copyWith(fontSize: 25),
                          alignment: AlignmentDirectional.centerStart,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          },
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 30),
                            width: 400,
                            child: Form(
                                child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    runSpacing: 20,
                                    children: <Widget>[
                                      Text(
                                          "Description",
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: textStyle.copyWith(fontSize: 25)
                                      ),
                                      TextFormField(
                                        minLines: 8,
                                        maxLines: 8,
                                        style: GoogleFonts.zenKurenaido(
                                          textStyle: const TextStyle(
                                            color: bleu_txt,
                                            fontSize: 17,
                                          ),
                                        ),
                                        textAlign: TextAlign.center,
                                        decoration: textInputDecoration.copyWith(),
                                      ),
                                    ]
                                )
                            )
                        )
                  ]
              )

              );
            }
        )
    );
  }
}
