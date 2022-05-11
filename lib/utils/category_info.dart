import 'package:shared_preferences/shared_preferences.dart';


class CategoryInfo {
  static const _keyCategoryId = 'category_id';
  static const _keyCategoryLibelle = 'category_libelle';
  static const _keyCategoryIcone = 'category_icone';
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  //get & set Id
  static Future setCategoryId(String categoryId) async => await _preferences.setString(_keyCategoryId, categoryId);
  static String getCategoryId() => _preferences.getString(_keyCategoryId).toString();

  //get & set Libelle
  static Future setUserEmail(String userEmail) async => await _preferences.setString(_keyCategoryLibelle, userEmail);
  static String getUserEmail() => _preferences.getString(_keyCategoryLibelle).toString();

  //get & set Icone
  static Future setUserLastname(String userLastname) async => await _preferences.setString(_keyCategoryIcone, userLastname);
  static String getUserLastname() => _preferences.getString(_keyCategoryIcone).toString();



}