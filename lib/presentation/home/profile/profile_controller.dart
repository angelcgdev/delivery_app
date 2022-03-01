import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/local_storage_reapository_interface.dart';
import 'package:delivery_app/domain/repository/login_api_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  final LocalReapositoryInterface localReapositoryInterface;
  final LoginApiReapositoryInterface loginApiReapositoryInterface;

  ProfileController({
    required this.localReapositoryInterface,
    required this.loginApiReapositoryInterface
  });  
  Rx<User?> user = Rx(null);

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {  
    localReapositoryInterface.getUser().then((value) {
      print('profile controller======>${value?.name}');
      user(value);
    });
  }

  Future<void> logout ()async{
    final token = await localReapositoryInterface.getToken();
    await loginApiReapositoryInterface.logout(token!);
    await localReapositoryInterface.cleanAllData();
  }
}
