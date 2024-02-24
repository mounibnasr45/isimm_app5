import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AppPreferences {
  static const String _rememberCheckBoxKey = 'rememberCheckBox';
//todo
  static Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> loadRememberCheckBoxState() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getBool(_rememberCheckBoxKey) ?? false;
  }

  static Future<void> saveRememberCheckBoxState(bool value) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setBool(_rememberCheckBoxKey, value);
  }
}