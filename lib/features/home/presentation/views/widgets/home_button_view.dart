import 'package:flutter/material.dart';
import '../../../../../core/consts.dart';

class HomeButtonView extends StatelessWidget {
  const HomeButtonView({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: MaterialButton(
        color: kPrimaryColor,
        height: MediaQuery.sizeOf(context).width / 2,
        minWidth: MediaQuery.sizeOf(context).width / 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kValueRound),
        ),
        onPressed: () {
          onPressed();
        },
        child: Icon(
          icon,
          size: 100,
          color: kSecColor,
        ),
      ),
    );
  }
}
