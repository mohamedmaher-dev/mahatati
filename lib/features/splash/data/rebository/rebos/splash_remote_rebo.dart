import 'package:flutter/material.dart';

import '../splash_rebo.dart';

class SplashRemoteRebo implements SplashRebo {
  @override
  navigateToHome({required BuildContext context}) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacementNamed("login");
      },
    );
  }
}
