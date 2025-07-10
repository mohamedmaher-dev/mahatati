import 'package:flutter/material.dart';

import '../../../../controllers/car/updatecar/updatecar_bloc.dart';
import '../../../../core/consts.dart';

class UpdateCarBottom extends StatelessWidget {
  const UpdateCarBottom({super.key, required this.controller});
  final UpdateCarBloc controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              color: kPrimaryColor,
              height: 50,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                controller.add(UpdateClickEvent(context: context));
              },
              child: const Text(
                style: TextStyle(color: kSecColor),
                "تحديث",
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              color: kRedColor,
              height: 50,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                controller.add(BackClickEvent(context: context));
              },
              child: const Text(
                style: TextStyle(
                  color: kSecColor,
                ),
                "الغاء",
              ),
            ),
          ),
        )
      ],
    );
  }
}
