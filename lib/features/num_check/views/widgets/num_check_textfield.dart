import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/check/num/num_bloc.dart';
import '../../../../core/consts.dart';

class NumCheckTextField extends StatelessWidget {
  const NumCheckTextField({super.key});

  @override
  Widget build(BuildContext context) {
    NumBloc controller = BlocProvider.of<NumBloc>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        controller: controller.phoneField,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        decoration: const InputDecoration(
          label: Text("الرقم"),
          prefixIcon: Icon(Icons.onetwothree_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(kValueRound),
            ),
          ),
        ),
      ),
    );
  }
}
