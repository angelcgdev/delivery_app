import 'package:delivery_app/domain/model/product.dart';

class ProductsCart {
  ProductsCart({required this.product, this.quantity = 1});
  final Product product;
  int quantity;

}