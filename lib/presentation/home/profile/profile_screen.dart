import 'package:delivery_app/presentation/home/profile/darkmode/darkmode_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_controller.dart';
import 'package:delivery_app/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProfileController(
    localReapositoryInterface: Get.find(),
    loginApiReapositoryInterface: Get.find(),
  ));
  static const _sizeProfile = 110.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body : Padding(
        padding: const EdgeInsets.all(Default.padding),
        child: Obx(
          () {
            final user = controller.user.value;
            print('profile Screen========>${user?.name}');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    height: _sizeProfile,
                    width: _sizeProfile,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_sizeProfile*.5),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: user!=null?Image.asset(user.image):null,
                  ),
                ),
                const SizedBox(height: 20),
                Text(user?.name??'', style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,),
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
                        Text(user?.username??''),                    
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  child: InkWell(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DarkModeScreen())),
                    child: Padding(
                      padding: const EdgeInsets.all(Default.padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Dark mode'),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: logout,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Log out'),
                ))
              ],
            );
          }
        ),
      ));
  }

  void logout() async{
    await controller.logout();
    Get.offAllNamed(DeliveryRoutes.login);
  }
}