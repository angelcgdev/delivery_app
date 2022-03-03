import 'package:delivery_app/domain/model/product.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

final products = [
  Product(
    name: 'Big Cheese Burger',
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger1.jpg'),
  Product(
    name: 'Burger Mix',
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger2.jpg'),
  Product(
    name: 'Big Meat',
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger3.jpg'),
  Product(
    name: 'Big Mix Power',
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger4.jpg'),
  Product(
    name: 'Meat Burger',    
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger5.jpg'),
  Product(
    name: 'Super Big Cheese Burger',    
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger6.jpg'),
  Product(
    name: 'Big fit Burger',    
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger7.jpg'),
  Product(
    name: 'Super Big Burger',
    shortDescription:  lorem(paragraphs: 1, words: 4),
    description: lorem(paragraphs: 4, words: 200),
    price: 30,
    image: 'assets/delivery/products/burger8.jpg'),
];