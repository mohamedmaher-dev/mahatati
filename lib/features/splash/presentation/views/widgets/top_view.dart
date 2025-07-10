import 'package:flutter/material.dart';

import '../../../../../core/consts.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "محطتي",
      style: TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
