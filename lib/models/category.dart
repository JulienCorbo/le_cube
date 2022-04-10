import 'package:flutter/cupertino.dart';

class ressourceCategory {
  String name;
  int id;
  IconData icon;

  ressourceCategory.fromJson(Map json)
      : id = json['id_categories_ressources'],
       name = json['cat_ressources_libelle'],
       icon = json['icone'];
  Map toJson() {
    return {'id' : id, 'name' : name, 'icon' : icon};
  }
}