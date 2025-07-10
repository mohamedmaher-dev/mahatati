import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/consts.dart';
import '../view_models/login/login_bloc.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBloc controller = BlocProvider.of<LoginBloc>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: MaterialButton(
        color: kPrimaryColor,
        height: 50,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kValueRound)),
        onPressed: () async {
          controller.add(LoginClickEvent(context: context));
        },
        child: const Text(
          "تسجيل الدخول",
          style: TextStyle(color: kSecColor, fontSize: 20),
        ),
      ),
    );
  }
}
