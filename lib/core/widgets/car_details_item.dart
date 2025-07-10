import 'package:flutter/material.dart';
import 'package:mahatati/core/consts.dart';

class CarDetailsItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  const CarDetailsItem({
    super.key,
    this.title,
    required this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title == "null" ? "غير معروف" : title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle == "null" ? "غير معروف" : subtitle!),
        trailing: trailing,
        leading: const VerticalDivider(
          width: 0,
          thickness: 5,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
