import 'package:flutter/material.dart';

import '../../../../core/consts.dart';

class QrCheckButton extends StatelessWidget {
  const QrCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: MaterialButton(
        color: kRedColor,
        height: 50,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kValueRound),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          "رجوع",
          style: TextStyle(color: kSecColor, fontSize: 20),
        ),
      ),
    );
  }
}
