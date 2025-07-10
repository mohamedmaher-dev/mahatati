import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/consts.dart';
import '../view_models/login/login_bloc.dart';

class PasswordFieldView extends StatelessWidget {
  const PasswordFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBloc controller = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextField(
          controller: controller.passField,
          decoration: InputDecoration(
            label: const Text("كلمة المرور"),
            prefixIcon: const Icon(Icons.password),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kValueRound),
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                controller.isHide ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                controller.add(ChangeHidePass());
              },
            ),
          ),
          obscureText: controller.isHide,
        );
      },
    );
  }
}
