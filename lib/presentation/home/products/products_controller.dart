import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/repository/products_api_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{

  final ProductRepositoryInterface productRepositoryInterface;

  ProductsController({required this.productRepositoryInterface});


  RxList<Product> productsList = <Product>[].obs;


  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async{
    final result = await productRepositoryInterface.getProducts();
    productsList(result);
  }

}