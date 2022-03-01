import 'package:delivery_app/presentation/theme.dart';
import 'package:flutter/material.dart';


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