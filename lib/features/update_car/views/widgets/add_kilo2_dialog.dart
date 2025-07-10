import 'package:flutter/material.dart';

import '../../../../controllers/car/updatecar/updatecar_bloc.dart';

class AddKilo2Dialog extends StatelessWidget {
  const AddKilo2Dialog({super.key, required this.controller});
  final UpdateCarBloc controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("ادخل رقم الكيلو"),
      content: TextFormField(
        controller: controller.kilo2Controller,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
        ),
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
      ),
      actions: [
        MaterialButton(
          child: const Text("تأكيد"),
          onPressed: () {
            controller.add(
              Kilo2SelectedEvent(
                context: context,
              ),
            );
          },
        )
      ],
    );
  }
}
