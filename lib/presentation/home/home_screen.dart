import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/favorites/car_screen.dart';
import 'package:delivery_app/presentation/home/home_controller.dart';
import 'package:delivery_app/presentation/home/products/products_scrren.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(
              ()=> IndexedStack(
                index: controller.indexSelected.value,
                children: [
                  const ProductsScreen(),
                  const ProductsScreen(),
                  CartScreen(onShopping: (){
                    controller.updateIndexSelected(0);
                  }),
                  const FavoritesScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
          ),
          Positioned(
            right: Default.padding,
            left: Default.padding,
            bottom: Default.padding,
            child: Obx(
              ()=> DeliveryAppNavigationBar(
                index: controller.indexSelected.value,
                onIndexSelected: (index){
                  controller.updateIndexSelected(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DeliveryAppNavigationBar extends StatelessWidget {
  DeliveryAppNavigationBar({Key? key, required this.index, required this.onIndexSelected}) : super(key: key);

  final int index;
  final void Function(int details) onIndexSelected;
  final controller = Get.find<HomeController>();  
  static const height = 75.0;
  static  const heigthCartButton = 55;
  static  const fullpadding = height-heigthCartButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Default.padding*.5),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness==Brightness.light?AppColors.white:AppColors.onSurface,
        borderRadius: BorderRadius.circular(Default.radius)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavBarItem(
            icon: Icons.home_outlined,
            onPressed: ()=>onIndexSelected(0),
          ),
          _NavBarItem(
            icon: Icons.store_outlined,
            onPressed: ()=>onIndexSelected(1),
          ),
          Material(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(heigthCartButton/2),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: ()=>onIndexSelected(2),
              child: const Padding(
                padding: EdgeInsets.all(fullpadding*.5),
                child: Icon(Icons.shopping_basket_sharp, color: AppColors.white, size: 35),
              ),
            )
          ),
          _NavBarItem(
            icon: Icons.favorite_border,
            onPressed: ()=>onIndexSelected(3),
          ),
          IconButton(
            onPressed: ()=>onIndexSelected(4),
            icon: Obx(
              (){
                final user = controller.user.value;
                return user == null?const SizedBox.shrink(): CircleAvatar(
                  backgroundImage: AssetImage(user.image),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.antiAlias, 
      child: IconButton(              
        onPressed: onPressed,
        icon: Icon(icon)
      ),
    );
  }
}