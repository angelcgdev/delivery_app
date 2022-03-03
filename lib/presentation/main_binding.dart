import 'package:delivery_app/data/datasource/login_api_repository_impl.dart';
import 'package:delivery_app/data/datasource/local_reapository_impl.dart';
import 'package:delivery_app/data/datasource/products_api_repository_impl.dart';
import 'package:delivery_app/domain/repository/login_api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_reapository_interface.dart';
import 'package:delivery_app/domain/repository/products_api_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalReapositoryInterface>(() => LocalReapositoryImpl());
    Get.lazyPut<LoginApiReapositoryInterface>(() => LoginApiRepositoryImpl());
    Get.lazyPut<ProductRepositoryInterface>(() => ProductsApiRepositoryImpl());
  }

}