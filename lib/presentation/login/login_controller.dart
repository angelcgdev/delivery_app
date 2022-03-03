import 'package:delivery_app/data/datasource/exception/auth_exception.dart';
import 'package:delivery_app/domain/repository/login_api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_reapository_interface.dart';
import 'package:delivery_app/domain/request/login_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final LocalReapositoryInterface localReapositoryInterface;
  final LoginApiReapositoryInterface apiReapositoryInterface;

  LoginController({
    required this.localReapositoryInterface,
    required this.apiReapositoryInterface
  });

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<bool> login() async{
    final username = usernameTextController.text.trim();
    final password = passwordTextController.text.trim();
    try {
      final loginResponse = await apiReapositoryInterface.login(
        LoginRequest(username, password),
      );

      await localReapositoryInterface.saveToken(loginResponse.token);
      await localReapositoryInterface.saveUser(loginResponse.user);
      return true;
      
    } on AuthException catch (_) {
      return false;
    }
  }

}