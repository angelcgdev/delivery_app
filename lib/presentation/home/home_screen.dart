import 'package:delivery_app/presentation/home/car/car_screen.dart';
import 'package:delivery_app/presentation/home/favorites/car_screen.dart';
import 'package:delivery_app/presentation/home/products/products_scrren.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: currentindex,
              children: const [
                ProductsScreen(),
                ProductsScreen(),
                CarScreen(),
                FavoritesScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            right: Default.padding,
            left: Default.padding,
            bottom: Default.padding,
            child: DeliveryAppNavigationBar(
              index: currentindex,
              onIndexSelected: (index){
                setState(() {
                  currentindex = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class DeliveryAppNavigationBar extends StatelessWidget {
  const DeliveryAppNavigationBar({Key? key, required this.index, required this.onIndexSelected}) : super(key: key);

  final int index;
  final void Function(int details) onIndexSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Default.padding*.5),
      width: double.infinity,
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
            borderRadius: BorderRadius.circular(55/2),
            clipBehavior: Clip.antiAlias, 
            child: InkWell(
              onTap: ()=>onIndexSelected(2),
              child: const Padding(
                padding: EdgeInsets.all(10),
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
            icon: const CircleAvatar(
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