import 'package:delivery_app/presentation/login/login_controller.dart';
import 'package:delivery_app/presentation/logo.dart';
import 'package:delivery_app/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:delivery_app/presentation/widgets/default_button.dart';
import 'package:delivery_app/presentation/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  void login(LoadingOverlay overlay)async{
    final result = await overlay.during(controller.login());
    if(result){
      Get.offAllNamed(DeliveryRoutes.home);
    }else{
      Get.snackbar('Error', 'Login incorrectr');
    }
  }

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned.fill(
                  bottom: Logo.sizeLogo*.5,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [.1, .9],
                        colors: appGradienst
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                    tag: Logo.tag,
                    child: Logo()
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(Default.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 7),
                        child: Text('Username ', style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      TextField(
                        controller: controller.usernameTextController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          hintText: 'username'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 7),
                        child: Text('Password ', style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      TextField(
                        controller: controller.passwordTextController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: '*******'
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      DefaultBotton(
                        label: 'Login',
                        opTap: ()=>login(overlay),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

