import 'package:flutter/material.dart';

import '../../../../../core/consts.dart';

class ButtomView extends StatelessWidget {
  const ButtomView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "App Version 2.0.0",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    );
  }
}
