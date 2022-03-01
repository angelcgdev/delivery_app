import 'package:delivery_app/presentation/home/home_binding.dart';
import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/login/login_binding.dart';
import 'package:delivery_app/presentation/login/login_screen.dart';
import 'package:delivery_app/presentation/main_binding.dart';
import 'package:delivery_app/presentation/splash/splash_binding.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

class DeliveryRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';

}

class DeliveryPages {
  static final pages = [
    GetPage(
      name: DeliveryRoutes.splash,
      page: ()=>const SplashScreen(),
      bindings: [MainBinding(), SplashBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: ()=>const LoginScreen(),
      bindings: [MainBinding(), LoginBinding()],
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: ()=>const HomeScreen(),
      bindings: [MainBinding(), HomeBinding()],
    ),
  ];
}