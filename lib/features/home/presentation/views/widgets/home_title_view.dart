import 'package:flutter/material.dart';

import '../../../../../core/consts.dart';

class HomeTitleView extends StatelessWidget {
  const HomeTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(kValueRound),
        ),
        border: Border.all(
          width: 2,
          color: kPrimaryColor,
        ),
      ),
      child: const Text(
        "اختر طريقة الأستخدام",
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
