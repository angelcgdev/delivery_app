import 'package:delivery_app/presentation/logo.dart';
import 'package:delivery_app/presentation/splash/splash_controller.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: appGradienst
          )
        ),
        child: SizedBox.expand(
          child: Column(                      
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(
                tag: Logo.tag,
                child: Logo()
              ),
              const SizedBox(height: 10),
              Text('Delivery App', style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold, color: AppColors.white))
            ],
          ),
        ),
      ),
    );
  }
}

