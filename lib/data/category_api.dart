import 'dart:async';
import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategory() {
    return http.get(Uri.parse("https://ressource-relationnelle.herokuapp.com/ressources/categories"));
  }
}