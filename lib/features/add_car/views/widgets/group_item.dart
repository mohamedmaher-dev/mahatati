import 'package:flutter/material.dart';
import 'package:mahatati/core/consts.dart';

class GroupItem extends StatelessWidget {
  const GroupItem(
      {super.key,
      required this.title,
      this.subtitle,
      this.trailing,
      this.leading});
  final String title;

  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 2,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(kValueRound)),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 20,
              ),
            ),
          ),
          subtitle: Padding(padding: const EdgeInsets.all(10), child: subtitle),
          trailing: trailing,
          leading: leading,
        ),
      ),
    );
  }
}
