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
  static Future setUserToken(String userToken) async => await _preferences.setString(_keyUserToken, userToken);
  static String getUserToken() => _preferences.getString(_keyUserToken).toString();
  static Future deleteUserToken() => _preferences.remove(_keyUserToken);

  //get & set Email
  static Future setUserEmail(String userEmail) async => await _preferences.setString(_keyUserEmail, userEmail);
  static String getUserEmail() => _preferences.getString(_keyUserEmail).toString();
  static Future deleteUserEmail() => _preferences.remove(_keyUserEmail);

  //get & set Lastname
  static Future setUserLastname(String userLastname) async => await _preferences.setString(_keyUserLastname, userLastname);
  static String getUserLastname() => _preferences.getString(_keyUserLastname).toString();
  static Future deleteUserLastname() => _preferences.remove(_keyUserLastname);

  //get & set Firstname
  static Future setUserFirstname(String userFirstname) async => await _preferences.setString(_keyUserFirstname, userFirstname);
  static String getUserFirstname() => _preferences.getString(_keyUserFirstname).toString();
  static Future deleteUserFirstname() => _preferences.remove(_keyUserFirstname);

  //get & set Role
  static Future setUserRole(String userRolename) async => await _preferences.setString(_keyUserRole, userRolename);
  static String getUserRole() => _preferences.getString(_keyUserRole).toString();
  static Future deleteUserRole() => _preferences.remove(_keyUserRole);

  //get & set Id
  static Future setUserId(String userId) async => await _preferences.setString(_keyUserID, userId);
  static String getUserId() => _preferences.getString(_keyUserID).toString();
  static Future deleteUserId() => _preferences.remove(_keyUserID);
}
