import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/consts.dart';
import '../view_models/login/login_bloc.dart';

class PhoneFieldView extends StatelessWidget {
  const PhoneFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBloc controller = BlocProvider.of<LoginBloc>(context);
    return TextFormField(
      controller: controller.phoneField,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: const InputDecoration(
        label: Text("رقم الهاتف"),
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kValueRound),
          ),
        ),
      ),
    );
  }
}
