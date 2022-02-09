import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/logo.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          hintText: 'username'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 7),
                        child: Text('Password ', style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: '*******'
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      DefaultBotton(label: 'Login', opTap: (){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_)=> const HomeScreen()
                          )
                        );
                      })
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

class DefaultBotton extends StatelessWidget {
  const DefaultBotton({
    Key? key,
    required this.label,
    required this.opTap
  }) : super(key: key);

  final String label;
  final GestureTapCallback opTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: opTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Default.radius),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: appGradienst
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(label, style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ),
        width: double.infinity,
      ),
    );
  }
}