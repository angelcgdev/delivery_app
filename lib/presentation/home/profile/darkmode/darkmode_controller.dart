import 'package:delivery_app/domain/repository/local_storage_reapository_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeController extends GetxController {
  
  final LocalReapositoryInterface localReapositoryInterface;
  
  DarkModeController({
    required this.localReapositoryInterface,
  });
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  
  @override
  void onReady() {
    loadCurrentTheme();
    super.onReady();
  }

  Future<void> loadCurrentTheme() async{
    final themevalue = await localReapositoryInterface.getTheme();
    themeMode(themevalue);
  }


  Future<ThemeMode> updateTheme(ThemeMode themeMode)async{
    await localReapositoryInterface.saveTheme(themeMode);
    await loadCurrentTheme();
    return themeMode;
  }

}