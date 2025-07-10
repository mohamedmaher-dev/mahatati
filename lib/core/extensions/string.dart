import 'package:flutter/material.dart';

extension StringExt on String {
  bool toBool() {
    if (this == "1") {
      return true;
    } else {
      return false;
    }
  }

  int toInt() {
    return int.parse(this);
  }

  double toDouble() {
    return double.parse(this);
  }

  DateTime toDateTime() {
    return DateTime.parse(this);
  }

  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
