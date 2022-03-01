import 'package:delivery_app/data/in_memory_products.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/repository/products_api_repository.dart';

class ProductsApiRepositoryImpl extends ProductRepositoryInterface{

  @override
  Future<List<Product>> getProducts() async{
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }

}