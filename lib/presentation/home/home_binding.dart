import 'package:delivery_app/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      localReapositoryInterface: Get.find(),
    ));
  }

}