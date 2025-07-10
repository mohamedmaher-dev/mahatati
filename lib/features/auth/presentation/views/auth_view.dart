import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/widgets/app_icon_view.dart';
import 'package:mahatati/features/auth/presentation/views/widgets/login_button.dart';
import 'package:mahatati/features/auth/presentation/views/widgets/password_field.dart';
import 'package:mahatati/features/auth/presentation/views/widgets/phone_field.dart';

import 'view_models/login/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc controller;
  @override
  Widget build(BuildContext context) {
    controller = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("تسجيل الدخول"),
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.all(20),
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: const [
            AppIconView(),
            SizedBox(height: 50),
            PhoneFieldView(),
            SizedBox(height: 20),
            PasswordFieldView(),
            LoginButtonView()
          ],
        ),
      ),
    );
  }
}
