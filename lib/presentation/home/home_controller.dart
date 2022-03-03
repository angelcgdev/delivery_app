import 'package:delivery_app/domain/model/user.dart';
import 'package:delivery_app/domain/repository/local_storage_reapository_interface.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final LocalReapositoryInterface localReapositoryInterface;

  HomeController({
    required this.localReapositoryInterface,
  });

  Rx<User?> user = Rx(null);
  RxInt  indexSelected = 0.obs;

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localReapositoryInterface.getUser().then((value) {
      user(value);
    });
  }

  void updateIndexSelected(int index) =>indexSelected(index);

}