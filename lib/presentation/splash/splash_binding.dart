import 'package:delivery_app/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(
      apiReapositoryInterface: Get.find(),
      localReapositoryInterface: Get.find(),
    ));
  }

}