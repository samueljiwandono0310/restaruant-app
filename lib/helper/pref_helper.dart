import 'package:flutter/foundation.dart';
import 'package:restaurant_app/helper/pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  SharedPreferences preferences;
  Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

  Future<SharedPreferences> _getPreferences() async {
    preferences = await _preferences;
    return preferences;
  }

  void setString(String key, String value) async {
    await _getPreferences().then((prefs) {
      prefs.setString(key, value);
    });
  }

  void setInt(String key, int value) async {
    await _getPreferences().then((prefs) {
      prefs.setInt(key, value);
    });
  }

  void setBool(String key, bool value) async {
    await _getPreferences().then((prefs) {
      prefs.setBool(key, value);
    });
  }

  void setDouble(String key, double value) async {
    await _getPreferences().then((prefs) {
      prefs.setDouble(key, value);
    });
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    return value;
  }

  Future<int> getInt(String key) async {
    var value;
    await _getPreferences().then((prefs) {
      value = prefs.getString(key);
    });
    return value;
  }

  Future<bool> getBool(String key) async {
    var value;
    await _getPreferences().then((prefs) {
      value = prefs.getBool(key);
    });
    return value;
  }

  Future<double> getDouble(String key) async {
    var value;
    await _getPreferences().then((prefs) {
      value = prefs.getString(key);
    });
    return value;
  }

  clearPreferences(String key) async {
    await _getPreferences().then((prefs) {
      prefs.remove(key);
    });
  }

  clearAllPreferences() async {
    await PrefHelper().clearPreferences(describeEnum(PrefsKey.id));
    await PrefHelper().clearPreferences(describeEnum(PrefsKey.address));
    await PrefHelper().clearPreferences(describeEnum(PrefsKey.dateOfBird));
    await PrefHelper().clearPreferences(describeEnum(PrefsKey.gender)); 
    await PrefHelper().clearPreferences(describeEnum(PrefsKey.nationality));   
    await PrefHelper().clearPreferences(describeEnum(PrefsKey.userName));
    await PrefHelper().clearPreferences(describeEnum(PrefsKey.nickName));
  }
}