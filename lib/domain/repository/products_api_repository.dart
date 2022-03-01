import 'package:delivery_app/domain/model/product.dart';

abstract class ProductRepositoryInterface {
  Future<List<Product>> getProducts();
}