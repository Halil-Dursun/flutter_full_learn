

import 'package:flutter_full_learn/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPrefKey{
  counter,
  user
}

class SharedManager{
  SharedPreferences? preferences;
  void init()async {
    preferences = await SharedPreferences.getInstance();
  }
  SharedManager(){
    init();
  }

  void _checkPreferences(){
    if(preferences == null){
      throw SharedNotIninializeException();
    }
  }
  Future<void> saveString(SharedPrefKey key,String value) async{
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }
  Future<void> saveStringItems(SharedPrefKey key, value) async{
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }
  List<String>? getStringList(SharedPrefKey key){
    _checkPreferences();
  return preferences?.getStringList(key.name);
  }
  String? getString(SharedPrefKey key){
    _checkPreferences();
  return preferences?.getString(key.name);
  }
  Future<bool> removeItem(SharedPrefKey key)async{
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}