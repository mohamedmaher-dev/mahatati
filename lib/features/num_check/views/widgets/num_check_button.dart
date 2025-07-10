import 'package:flutter/material.dart';

import '../../../../core/consts.dart';

class NumCheckButton extends StatelessWidget {
  const NumCheckButton({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });
  final String title;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: MaterialButton(
        color: color,
        height: 50,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kValueRound)),
        onPressed: (onPressed),
        child: Text(
          title,
          style: const TextStyle(color: kSecColor, fontSize: 20),
        ),
      ),
    );
  }
}
