import 'package:shared_preferences/shared_preferences.dart';


class GetFileInfo {
  static const _keyFileInfo = 'file_key';
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  //get & set Key
  static Future setFileKey(String fileKey) async => await _preferences.setString(_keyFileInfo, fileKey);
  static String getFileKey() => _preferences.getString(_keyFileInfo).toString();
}