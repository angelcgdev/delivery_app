import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);
  static const sizeLogo = 80.0;
  static const tag = 'logo';
  static const margin = 4.0;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: sizeLogo,
      width: sizeLogo,
      margin: const EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sizeLogo*.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightShadow,
            spreadRadius: 0,
            blurRadius: margin,
            offset: Offset(0, 0), // changes position of shadow
          ),
    ],
      ),
      child: Text('D', style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
    );
  }
}