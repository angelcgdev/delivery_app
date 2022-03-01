import 'package:delivery_app/domain/model/user.dart';
import 'package:flutter/material.dart';

abstract class LocalReapositoryInterface {
  Future<String?> getToken();
  Future<String> saveToken(String token);
  Future<void> cleanAllData();
  Future<User> saveUser(User user);
  Future<User?> getUser();
  Future<void> saveTheme(ThemeMode theme);
  Future<ThemeMode> getTheme();
}