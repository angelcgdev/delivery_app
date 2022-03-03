import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/local_storage_reapository_interface.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalReapositoryImpl with LocalReapositoryInterface {
  static const _prefToken = 'TOKEN';
  static const _prefName = 'NAME';
  static const _prefUsername = 'USERNAME';
  static const _prefImage = 'IMAGE';
  static const _prefTheme = 'THEME';

  @override
  Future<void> cleanAllData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefToken);
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefToken, token);
    return token;
  }

  @override
  Future<User> getUser() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.reload();
    final name = sharedPreferences.getString(_prefName)!;
    final userName = sharedPreferences.getString(_prefUsername)!;
    final image = sharedPreferences.getString(_prefImage)!;
    final user = User(
      image: image,
      name: name,
      username: userName
    );
    return user;
  }

  @override
  Future<User> saveUser(User user) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefName, user.name);
    sharedPreferences.setString(_prefUsername, user.username);
    sharedPreferences.setString(_prefImage, user.image);
    return user;
  }

  @override
  Future<void> saveTheme(ThemeMode theme) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_prefTheme, theme.toString());
    return;
  }

  @override
  Future<ThemeMode> getTheme() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final resp = sharedPreferences.getString(_prefTheme);
    if(resp!=null){
      final match = ThemeMode.values.firstWhere((element) => element.toString()==resp);
      return match;
    }else{
      return ThemeMode.system;
    }
  }


}