import 'package:delivery_app/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/presentation/home/products/products_controller.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final controller = Get.put(
    ProductsController(
      productRepositoryInterface: Get.find()
    ),
  );
  final cardController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body : Obx(
        ()=> controller.productsList.isNotEmpty? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
      
            childAspectRatio: 9/12,
          ),
          padding: const EdgeInsets.all(Default.padding*.5),
          itemCount: controller.productsList.length,
          itemBuilder: (context, i){
            final _product = controller.productsList[i];
            return _ItemProduct(
              product: _product,
              onTap: (){
                cardController.add(_product);
              }
            );
          },
        ): const Center( child: CircularProgressIndicator(),)
      ),
    );
  }
}


class _ItemProduct extends StatelessWidget {
  const _ItemProduct({Key? key, required this.product, required this.onTap}) : super(key: key);
  final Product product;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    const imageSize = 100.0;
    const btnSize = 40.0;
    final _theme = Theme.of(context);
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(Default.padding*.5),
      child: Padding(
        padding: const EdgeInsets.all(Default.padding),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: Container(
                  height: imageSize,
                  width: imageSize,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(imageSize*.5),
                  ),
                  child: ClipOval(
                    child: Image.asset(product.image, fit: BoxFit.cover))),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(product.name, style:  _theme.textTheme.titleMedium, maxLines: 1),
                Text(product.shortDescription, style:  _theme.textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ ${product.price}', style: _theme.textTheme.titleLarge,),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: btnSize,
                        width: btnSize,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(btnSize*.5),    
                          color: _theme.colorScheme.background,                    
                          boxShadow: [
                            if(_theme.brightness == Brightness.light)
                            BoxShadow(
                              color: _theme.colorScheme.shadow,
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        
                        // padding: const EdgeInsets.all(10),
                        child: const Icon(Icons.arrow_forward_ios, size: btnSize*.5),
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}