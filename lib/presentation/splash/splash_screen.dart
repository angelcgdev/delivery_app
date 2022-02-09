import 'package:delivery_app/presentation/login/login_screen.dart';
import 'package:delivery_app/presentation/logo.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_)=> const LoginScreen()
        ),
      );
    });
  }

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

