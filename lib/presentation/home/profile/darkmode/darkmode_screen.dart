import 'package:delivery_app/presentation/home/profile/darkmode/darkmode_controller.dart';
import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DarkModeScreen extends StatelessWidget {
  DarkModeScreen({Key? key}) : super(key: key);

  final controller = Get.put(DarkModeController(
    localReapositoryInterface: Get.find(),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Default.padding),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(Default.padding),
                child: Obx(
                  (){
                    final _themeMode = controller.themeMode.value;
                    final _brightnes = Theme.of(context).brightness;
                    return Column(
                      children: [
                        SizedBox(
                          height: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: SizedBox.square(
                                      dimension: 50,
                                      child: SvgPicture.asset('assets/icons/darkmode/sun.svg', color: _brightnes==Brightness.light?const Color.fromARGB(255, 255, 222, 100):AppColors.shadow,)
                                    ),
                                  ),
                                  const Text('Light'),
                                  Checkbox(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    shape: const CircleBorder(),
                                    value: _themeMode == ThemeMode.light,
                                    onChanged: (_)async{
                                      final theme = await controller.updateTheme(ThemeMode.light);
                                      Get.changeThemeMode(theme);
                                    })
                                ],
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: SizedBox.square(
                                      dimension: 35,
                                      child: SvgPicture.asset('assets/icons/darkmode/moon.svg', color: _brightnes==Brightness.dark?const Color.fromARGB(255, 255, 222, 100):AppColors.shadow)
                                    ),
                                  ),
                                  const Text('Dark'),
                                  Checkbox(
                                    shape: const CircleBorder(),
                                    value: _themeMode == ThemeMode.dark,
                                    onChanged: (_)async{
                                      final theme = await controller.updateTheme(ThemeMode.dark);
                                      Get.changeThemeMode(theme);
                                    })
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 0),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Automatic'),
                            _CustomSwich(
                              onTap: ()async{
                                final theme = await controller.updateTheme(ThemeMode.system);
                                Get.changeThemeMode(theme);
                              },
                              value: _themeMode == ThemeMode.system,
                            )
                          ],
                        )
                      ],
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomSwich extends StatelessWidget {
  const _CustomSwich({
    Key? key,
    required this.onTap,
    required this.value,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final bool value;

  static const size = 25.0;
  // bool state = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: size,
        width: size*2,
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: value?Theme.of(context).colorScheme.secondary:AppColors.lightShadow,
          borderRadius: BorderRadius.circular(size*.5)
        ),
        child: Padding(
          padding: const EdgeInsets.all(size*.1),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                left : value?(size):0,
                height: size*.8,
                width: size*.8,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular((size*.8)*.5)    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}