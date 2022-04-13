import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:le_cube/screens/category.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';
import 'package:le_cube/data/category_api.dart';
import 'package:le_cube/models/category.dart';

class addRessource extends StatefulWidget {
  const addRessource({Key? key}) : super(key: key);

  @override
  _addRessourceState createState() => _addRessourceState();
}

class _addRessourceState extends State<addRessource> {
  List<ressourceCategory> categoryList = List<ressourceCategory>.empty();

  void getCategoryFromApi() async {
    CategoryApi.getCategory().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categoryList = list.map((model) => ressourceCategory.fromJson(model)).toList();
        print(categoryList);
      });
    });
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  String? dropdownvalue = 'Selectionner une catégorie';
  bool friendChecked = false;
  bool parentChecked = false;
  bool coworkerChecked = false;
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
  void initState() {
    super.initState();
    getCategoryFromApi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        endDrawer: NavigationDrawerWidget(),
        body: LayoutBuilder(
            builder: (BuildContext context,
                BoxConstraints viewportConstraints) {
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
                                  "AJOUT D'UNE RESSOURCE",
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
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            width: 400,
                            child: Form(
                                child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
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
                                        decoration: textInputDecoration,
                                      ),
                                      Text(
                                          "Catégorie",
                                          textAlign: TextAlign.left,
                                          style: textStyle.copyWith(fontSize: 25)
                                      ),
                                      /*DropdownButton(
                                        isDense: true,
                                        value: dropdownvalue,
                                        style: textStyle.copyWith(fontSize: 22),
                                        alignment: AlignmentDirectional.centerStart,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: categoryList.map((item) {
                                          return DropdownMenuItem(
                                              value: item['name'],
                                              child: Text(item['name']);
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            dropdownvalue = newValue;
                                          });
                                        },
                                      ),*/
                                      TextFormField(
                                        style: textStyle.copyWith(fontSize: 17),
                                        textAlign: TextAlign.center,
                                        decoration: textInputDecoration.copyWith(hintText: 'FAIRE DROPDOWNMENU AVEC JSON'),

                                      ),
                                      Text(
                                          "Fichier",
                                          textAlign: TextAlign.center,
                                          style: textStyle.copyWith(fontSize: 25)
                                      ),
                                      SizedBox(width: 20),
                                      ElevatedButton(
                                        style: buttonWhite,
                                          onPressed: (){},
                                          child: Text('+')
                                      ),
                                      CheckboxListTile(
                                          controlAffinity: ListTileControlAffinity.leading,
                                          value: friendChecked,
                                          title: Text(
                                              'Amis',
                                            style: textStyle.copyWith(fontSize: 25),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              friendChecked = value!;
                                            });
                                          }
                                      ),
                                      CheckboxListTile(
                                          controlAffinity: ListTileControlAffinity.leading,
                                          value: parentChecked,
                                          title: Text(
                                            'Parent',
                                            style: textStyle.copyWith(fontSize: 25),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              parentChecked = value!;
                                            });
                                          }
                                      ),
                                      CheckboxListTile(
                                          controlAffinity: ListTileControlAffinity.leading,
                                          value: coworkerChecked,
                                          title: Text(
                                            'Collègue',
                                            style: textStyle.copyWith(fontSize: 25),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              coworkerChecked = value!;
                                            });
                                          }
                                      ),
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
                                            color: blueText,
                                            fontSize: 17,
                                          ),
                                        ),
                                        textAlign: TextAlign.center,
                                        decoration: textInputDecoration.copyWith(),
                                      ),
                                      ElevatedButton(
                                          style: buttonBlue,
                                          onPressed: () {},
                                          child: const Text('ENVOYER')
                                      ),
                                    ]
                                )
                            )
                        ),
                      ]
                  )

              );
            }
        )
    );
  }
}