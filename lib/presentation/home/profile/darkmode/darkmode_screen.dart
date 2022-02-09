import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DarkModeScreen extends StatelessWidget {
  const DarkModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Default.padding),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(Default.padding),
                child: Column(
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
                                  child: SvgPicture.asset('assets/icons/darkmode/sun.svg')
                                ),
                              ),
                              const Text('Light'),
                              Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: const CircleBorder(),
                                value: true, onChanged: (_){})
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                child: SizedBox.square(
                                  dimension: 35,
                                  child: SvgPicture.asset('assets/icons/darkmode/moon.svg')
                                ),
                              ),
                              const Text('Dark'),
                              Checkbox(
                                shape: const CircleBorder(),
                                value: false, onChanged: (_){})
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 0),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Automatic'),
                        _CustomSwich()
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomSwich extends StatefulWidget {
  const _CustomSwich({
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomSwich> createState() => _CustomSwichState();
}

class _CustomSwichState extends State<_CustomSwich> {
  final size = 25.0;
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          state = !state;
        });
      },
      child: AnimatedContainer(
        height: size,
        width: size*2,
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: state?AppColors.lightShadow:Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(size*.5)
        ),
        child: Padding(
          padding: EdgeInsets.all(size*.1),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                left : state?0:(size),
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