import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mahatati/controllers/check/num/num_bloc.dart';
import 'package:mahatati/features/num_check/views/widgets/num_check_button.dart';
import 'package:mahatati/features/num_check/views/widgets/num_check_textfield.dart';
import 'package:mahatati/features/num_check/views/widgets/num_check_title.dart';

class CheckNum extends StatefulWidget {
  const CheckNum({super.key});

  @override
  State<CheckNum> createState() => _CheckNumState();
}

class _CheckNumState extends State<CheckNum> {
  @override
  void initState() {
    BlocProvider.of<NumBloc>(context).add(InitEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NumBloc controller = BlocProvider.of<NumBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "الفحص بواسطة الرقم",
          style: TextStyle(
            color: kSecColor,
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          const NumCheckTitle(),
          const NumCheckTextField(),
          const Spacer(),
          NumCheckButton(
            title: "فحص",
            color: kPrimaryColor,
            onPressed: () {
              controller.add(CheckClickEvent(context: context));
            },
          ),
          NumCheckButton(
            title: "رجوع",
            color: kRedColor,
            onPressed: () {
              controller.add(BackClickEvent(context: context));
            },
          ),
        ],
      ),
    );
  }
}
