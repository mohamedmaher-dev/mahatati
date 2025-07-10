import 'package:flutter/material.dart';

import '../../../../core/consts.dart';

class CarDetailsBottom extends StatelessWidget {
  const CarDetailsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MaterialButton(
        color: kPrimaryColor,
        height: 50,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          style: TextStyle(color: kSecColor),
          "موافق",
        ),
      ),
    );
  }
}
