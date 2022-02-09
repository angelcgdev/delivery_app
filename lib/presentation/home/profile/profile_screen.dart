import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body : Padding(
        padding: const EdgeInsets.all(Default.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.purple ,
            ),
            const SizedBox(height: 20),
            Text('Sara Tunner', style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(Default.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Personal Information', textAlign: TextAlign.center),
                    const SizedBox(height: 10),
                    const Text('Mail'),
                    const Text('Saratunner@gmail.com'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Dark mode'),
                        Switch(value: false, onChanged: (v){})
                      ],
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ));
  }
}