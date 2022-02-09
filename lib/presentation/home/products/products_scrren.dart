import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body : Padding(
        padding: const EdgeInsets.all(Default.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Explore categories'),
            Text('Popular products'),
            Text('Recommended')
          ],
        ),
      ),
    );
  }
}