import 'package:delivery_app/domain/repository/login_api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_reapository_interface.dart';
import 'package:delivery_app/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final LocalReapositoryInterface localReapositoryInterface;
  final LoginApiReapositoryInterface apiReapositoryInterface;

  SplashController({
    required this.localReapositoryInterface,
    required this.apiReapositoryInterface
  });

  @override
  void onInit() {
    validteTheme();
    super.onInit();
  }

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }


  void validateSession() async {
    final token = await localReapositoryInterface.getToken();
    if(token != null){
      final user = await apiReapositoryInterface.getUserFromToken(token);
      await localReapositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    }else{
      Get.offNamed(DeliveryRoutes.login);
    }

  }

  void validteTheme() async{
    late ThemeMode test;
    final themeMode = await localReapositoryInterface.getTheme();
    print('THEME====================>${themeMode.name}');
    if(themeMode != ThemeMode.system){
      Get.changeTheme(Get.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme);
    }
  }
}