import 'package:flutter/material.dart';
import 'package:mahatati/features/home/data/rebository/home_rebo.dart';

class HomeRemoteRebo implements HomeRebo {
  @override
  navigateToCheckNum({required BuildContext context}) {
    Navigator.of(context).pushNamed("checknum");
  }

  @override
  navigateToCheckQR({required BuildContext context}) {
    Navigator.of(context).pushNamed("checkqr");
  }
}
