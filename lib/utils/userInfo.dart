import 'package:shared_preferences/shared_preferences.dart';


class UserInfo {
  static const _keyUserToken = 'user_token';
  static const _keyUserEmail = 'user_email';
  static const _keyUserFirstname = 'user_firstname';
  static const _keyUserLastname = 'user_lastname';
  static const _keyUserRole = 'user_role';
  static const _keyUserID = 'user_id';
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;
  
  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  //get & set Token
  static Future setUserToken(String UserToken) async =>
      await _preferences.setString(_keyUserToken, UserToken);
  static String getUserToken() => _preferences.getString(_keyUserToken).toString();

  //get & set Email
  static Future setUserEmail(String UserEmail) async =>
      await _preferences.setString(_keyUserEmail, UserEmail);
  static String getUserEmail() => _preferences.getString(_keyUserEmail).toString();

  //get & set Lastname
  static Future setUserLastname(String UserLastname) async =>
      await _preferences.setString(_keyUserLastname, UserLastname);
  static String getUserLastname() => _preferences.getString(_keyUserLastname).toString();

  //get & set Firstname
  static Future setUserFirstname(String UserFirstname) async =>
      await _preferences.setString(_keyUserFirstname, UserFirstname);
  static String getUserFirstname() => _preferences.getString(_keyUserFirstname).toString();

  //get & set Role
  static Future setUserRole(String UserRolename) async =>
      await _preferences.setString(_keyUserRole, UserRolename);
  static String getUserRole() => _preferences.getString(_keyUserRole).toString();

  //get & set Id
  static Future setUserId(String UserId) async =>
      await _preferences.setString(_keyUserID, UserId);
  static String getUserId() => _preferences.getString(_keyUserID).toString();
}