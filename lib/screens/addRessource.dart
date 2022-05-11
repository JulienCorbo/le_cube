import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:le_cube/screens/category.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:le_cube/commons/constants.dart';
import 'package:le_cube/utils/fileInfo.dart';
import 'package:le_cube/utils/userInfo.dart';
import 'package:le_cube/widgets/navigationDrawer.dart';
import 'package:le_cube/models/category.dart';
import 'package:le_cube/models/file.dart';
import 'package:le_cube/screens/homePage.dart';

Future<String> sendFile(BuildContext context, String filePath, String fileName) async {
  String key = '';
  var uri = Uri.parse('https://ressource-relationnelle.herokuapp.com/upload');
  var request = http.MultipartRequest('POST', uri)
    ..files.add(await http.MultipartFile.fromPath('file', filePath, filename: fileName));
  request.send().then((result) async {
    http.Response.fromStream(result).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        keyFile = map['key'];
        return keyFile;
      }
    });
  }).catchError((err) => print('error : '+err.toString()))
      .whenComplete(()
  {});
  return '';
}

Future<int> sendRessources(BuildContext context, String title, int idCategory, String description, String userId, List relation, String fileKey) async {
  final response = await http.post(
    Uri.parse('https://ressource-relationnelle.herokuapp.com/ressource/new'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'titre' : title,
      'categorie' : idCategory+1,
      'description' : description,
      'user_id' : userId,
      'relation' : relation,
      'pj' : fileKey,
    }),
  );

  if (response.statusCode == 200) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const homePage()
    ));
    print(response.body);
    return 1;
  } else {
    print(response.body);
    throw Exception('Failed to create album.');
  }
}


class addRessource extends StatefulWidget {
  const addRessource({Key? key}) : super(key: key);

  @override
  _addRessourceState createState() => _addRessourceState();
}

class _addRessourceState extends State<addRessource> {
  bool fileIsPicked = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<ressourceCategory> categoryList = List<ressourceCategory>.empty();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  String? dropDownValue = 'Art';
  int categoryChoose = 0;
  bool friendChecked = false;
  bool parentChecked = false;
  double? fileZoneHeight = 30;
  String fileChoose = 'Veuillez-choisir un fichier';
  String fileChooseName = '';
  String fileKey = '';
  String pathFile = '';
  Future<int>? _futureAlbum;

  List _selecteRelation = [];
  Map<String, dynamic> _relation = {
    "responseBody": [
      {"relation_id": "0", "relation_name": "Amis"},
      {"relation_id": "1", "relation_name": "Parent"},
    ],
    "Total" : 2
  };

  void _onRelationSelected(bool? selected, relation_name) {
    if (selected == true) {
      setState(() {
        _selecteRelation.add(relation_name);
      });
    } else {
      setState(() {
        _selecteRelation.remove(relation_name);
      });
    }
  }

  int _findCategoryId(List<String> items, String category){
    categoryChoose = items.indexWhere((element) => element == category);
    return categoryChoose;
  }

  List<String> items = [
    "Art",
    "Banque",
    "Histoire",
    "Nature",
    "Science",
    "Architecture",
    "Jeunesse ",
    "Culture ",
    "Musique ",
    "Littérature ",
    "Autre",
  ];

  Widget build(BuildContext context) {
    GlobalKey<FormState> _form = GlobalKey<FormState>();
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
                                border: Border(bottom: BorderSide(
                                    color: blueBorder, width: 4))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _globalKey.currentState
                                              ?.openEndDrawer();
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 30),
                            width: 400,
                            child: Form(
                                key: _form,
                                child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment
                                        .center,
                                    alignment: WrapAlignment.center,
                                    runSpacing: 10,
                                    children: <Widget>[
                                      Text(
                                          "Titre de la ressource",
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.bold)
                                      ),
                                      TextFormField(
                                        controller: titleController,
                                        style: textStyle.copyWith(fontSize: 17),
                                        textAlign: TextAlign.center,
                                        decoration: textInputDecoration,
                                      ),
                                      Text(
                                          "Catégorie",
                                          textAlign: TextAlign.left,
                                          style: textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.bold)
                                      ),
                                      DropdownButtonFormField(
                                        value: dropDownValue,
                                        decoration: textInputDecoration.copyWith(),
                                        style: textStyle.copyWith(fontSize: 20),
                                        alignment: AlignmentDirectional.centerStart,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: items.map((items) {
                                          return DropdownMenuItem(value: items, child: Text(items));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropDownValue = newValue;
                                          });
                                        },
                                      ),
                                      Text(
                                          "Fichier",
                                          textAlign: TextAlign.center,
                                          style: textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.bold)
                                      ),
                                      const SizedBox(width: double.infinity),
                                      ElevatedButton(
                                          style: buttonAdd,
                                          onPressed: () async {
                                            FilePickerResult? result = await FilePicker.platform.pickFiles();

                                            if (result != null) {
                                              final file = result.files.single.path as String;
                                              final fileName = result.files.single.name;
                                              setState(() {
                                                fileChoose = file;
                                                fileChooseName = fileName;
                                                fileIsPicked = true;
                                              });
                                            }
                                          },
                                          child: Text('+')
                                      ),
                                      const SizedBox(width: double.infinity),
                                      Text(
                                        fileChoose,
                                        style: textStyle,
                                      ),
                                      const SizedBox(width: double.infinity),
                                      Text(
                                          "Relation",
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.bold)
                                      ),
                                      SizedBox(
                                        child: ListView.builder(
                                            padding: EdgeInsets.all(0.0),
                                            physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: _relation['Total'],
                                            itemBuilder: (BuildContext context, int index) {
                                              return CheckboxListTile(
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: _selecteRelation
                                                    .contains(_relation['responseBody'][index]['relation_name']),
                                                onChanged: (bool? selected) {
                                                  _onRelationSelected(selected,
                                                      _relation['responseBody'][index]['relation_name']);
                                                },
                                                title: Text(
                                                  _relation['responseBody'][index]['relation_name'],
                                                  style: textStyle.copyWith(fontSize: 23),
                                                ),
                                              );
                                            }),
                                      ),
                                      Text(
                                          "Description",
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: textStyle.copyWith(fontSize: 25, fontWeight: FontWeight.bold)
                                      ),
                                      TextFormField(
                                        controller: descriptionController,
                                        minLines: 8,
                                        maxLines: 8,
                                        style: GoogleFonts.zenKurenaido(
                                          textStyle: const TextStyle(
                                            color: blueText,
                                            fontSize: 17,
                                          ),
                                        ),
                                        textAlign: TextAlign.center,
                                        decoration: textInputDecoration,
                                      ),
                                      ElevatedButton(
                                          style: buttonBlue,
                                          onPressed: () {
                                            if (_form.currentState!.validate()) {
                                              setState(() async {
                                                fileKey = await sendFile(
                                                    context,
                                                    fileChoose,
                                                    fileChooseName
                                                );
                                                print('KEEEY : ' + keyFile);
                                                _futureAlbum = sendRessources(
                                                    context,
                                                    titleController.value.text,
                                                    _findCategoryId(items, dropDownValue!),
                                                    descriptionController.value.text,
                                                    UserInfo.getUserId(),
                                                    _selecteRelation,
                                                    keyFile
                                                );
                                                print('finito');
                                                keyFile = '';
                                              });
                                            }
                                          },
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
