import 'package:delivery_app/domain/model/delivery_address.dart';
import 'package:delivery_app/domain/model/product_cart.dart';
import 'package:delivery_app/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/data/deliveryaddesses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({Key? key, required this.onShopping}) : super(key: key);
  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Obx((){
        
        return (controller.totalItems.value==0) ?
        _EmptyCart(onShopping: onShopping):
        const _FullCart();
      }),
    );
  }
}

class _FullCart extends GetWidget<CartController> {
  const _FullCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 102,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(Default.padding),
              itemCount: deliveryAddresses.length,
              itemBuilder: (context, index){
                return _DeliveryAddresses(data:deliveryAddresses[index]);
              }
            ),
          ),
          SizedBox(
            height: 300,
            child: Obx(
              (){
                final cardProducst = controller.cartList;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardProducst.length,
                  itemExtent: 250,
                  itemBuilder: (context, index){
                    final cardProduct = cardProducst[index];
                    return _ShoppingCartPorduct(
                      productCart:cardProduct,
                      onIncremenent: (){
                        controller.increment(cardProduct);
                      },
                      onDecrement: (){
                        controller.decrement(cardProduct);
                      },
                      onDelete: (){
                        controller.deleteProduct(cardProduct);
                      },
                    );
                  }
                );
              }
            ),
          ),
          SizedBox(
            child: Card(
              margin: const EdgeInsets.all(Default.padding),
              child: Padding(
                padding: const EdgeInsets.all(Default.padding),
                child: Obx((){
                  final subtotal = controller.subtotalPrice;
                  final total = controller.totalPrice;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('SubTotal:'),
                          Text('\$${subtotal.value} usd')
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Delivery:'),
                          Text('Free')
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:', style: _theme.textTheme.titleMedium,),
                          Text('\$${total.value} usd', style: _theme.textTheme.titleMedium)
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: (){}, 
                        child: const Text('Checkout'),
                        style: _theme.elevatedButtonTheme.style?.copyWith(minimumSize: MaterialStateProperty.all(const Size(double.infinity, 55))
                      ),
                      )
                    ],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DeliveryAddresses extends StatelessWidget {
  const _DeliveryAddresses({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DeliveryAddress data;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(Default.padding*.8),
          decoration: BoxDecoration(
            color: data.isSelect?_theme.colorScheme.primary:_theme.colorScheme.background,
            borderRadius: BorderRadius.circular(Default.radius),
            border: data.isSelect?null:Border.all(color: _theme.colorScheme.shadow)
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/home.svg', height: 20, color: data.isSelect?_theme.colorScheme.onPrimary:_theme.colorScheme.primary),
              const SizedBox(width: Default.padding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(data.title, style: _theme.textTheme.labelMedium?.copyWith(color: data.isSelect?_theme.colorScheme.onPrimary:null)),
                  Text(data.description, style: _theme.textTheme.labelMedium?.copyWith(color: data.isSelect?_theme.colorScheme.onPrimary:null),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class _EmptyCart extends StatelessWidget {
  const _EmptyCart({Key? key,  required this.onShopping}) : super(key: key);
  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset('assets/emoticons/deadpan.svg', color: _theme.colorScheme.onBackground, width: 100, height: 100,),
        const SizedBox(height: Default.padding),
        const Text('There are no products', textAlign: TextAlign.center),
        const SizedBox(height: Default.padding),
        Center(
          child: ElevatedButton(onPressed:  onShopping, child: const Text('Go shopping'))
        ),
      ],
    );
  }
}



class _ShoppingCartPorduct extends StatelessWidget {
  const _ShoppingCartPorduct({Key? key, required this.productCart, required this.onIncremenent, required this.onDecrement, required this.onDelete}) : super(key: key);
  final ProductsCart productCart;
  final GestureTapCallback onIncremenent;
  final GestureTapCallback onDecrement;
  final GestureTapCallback onDelete;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    const imageSize = 100.0;
    return Stack(
      children: [
        Card(
          elevation: 8,
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
                        child: Image.asset(productCart.product.image, fit: BoxFit.cover))),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(productCart.product.name, style:  _theme.textTheme.titleMedium, maxLines: 1,  textAlign: TextAlign.center),
                    Text(productCart.product.shortDescription, style:  _theme.textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
                    const SizedBox(height: Default.padding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _SmallBtn(icon: Icons.remove, onTap: onDecrement),
                        Text(productCart.quantity.toString()),
                        _SmallBtn(icon: Icons.add, onTap: onIncremenent),
                        Text('\$ ${productCart.product.price}', style: _theme.textTheme.titleLarge,),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: onDelete,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: _theme.colorScheme.error,
              child: Icon(Icons.delete_outline, color: _theme.colorScheme.onError),
            ),
          ),
        )
      ],
    );
  }
}

class _SmallBtn extends StatelessWidget {
  const _SmallBtn({Key? key, required this.icon, required this.onTap}) : super(key: key);
  final GestureTapCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    const btnSize = 30.0;
    final _theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: btnSize,
        width: btnSize,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(btnSize*.1),    
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
        child: Icon(icon, size: btnSize*.5),
      ),
    );
  }
}