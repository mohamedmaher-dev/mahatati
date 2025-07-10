import 'package:flutter/material.dart';
import '../consts.dart';

class AppIconView extends StatelessWidget {
  const AppIconView({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      kLogoPath,
      height: 150,
    );
  }
}
