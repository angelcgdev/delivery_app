import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/product_cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<ProductsCart> cartList = <ProductsCart>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble deliveryPrice = 0.0.obs;
  RxDouble subtotalPrice = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;

  void add(Product product){
    final tmp = List<ProductsCart>.from(cartList);
    bool found = false;
    for (ProductsCart p in tmp) {
      if(p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if(!found){
      tmp.add(ProductsCart(product: product));
    }
    cartList(tmp);
    calculateTotals(tmp);
    calculatePrices(tmp);
  }

  void increment(ProductsCart productCard){    
    productCard.quantity+=1;
    cartList(List<ProductsCart>.from(cartList));
    calculateTotals(cartList);
    calculatePrices(cartList);
  }

  void decrement(ProductsCart productCard){
    productCard.quantity-=1;
    if(productCard.quantity==0){
      deleteProduct(productCard);
    }
    cartList(List<ProductsCart>.from(cartList));
    calculateTotals(cartList);
    calculatePrices(cartList);
  }

  void calculateTotals(List<ProductsCart> tmp){
    final total = tmp.fold(0, (int previousValue, element) => element.quantity + previousValue);
    totalItems(total);
  }

  void calculatePrices(List<ProductsCart> tmp){
    final subtotal = tmp.fold<double>(0.0, (double previousValue, element) => (element.product.price*element.quantity) + previousValue);
    final total = subtotal + deliveryPrice.value;
    subtotalPrice(subtotal);
    totalPrice(total);
  }

  void deleteProduct(ProductsCart product){    
    cartList.remove(product);
    calculateTotals(cartList);
    calculatePrices(cartList);
  }
}