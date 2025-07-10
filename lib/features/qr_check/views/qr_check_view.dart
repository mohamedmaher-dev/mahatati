import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/check/qr/qr_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mahatati/features/qr_check/views/widgets/qr_check_button.dart';
import 'package:mahatati/features/qr_check/views/widgets/qr_check_icon_button.dart';
import 'package:mahatati/features/qr_check/views/widgets/qr_check_title.dart';

class QRView extends StatefulWidget {
  const QRView({super.key});

  @override
  State<QRView> createState() => _CheckQRState();
}

class _CheckQRState extends State<QRView> {
  @override
  void initState() {
    BlocProvider.of<QrBloc>(context).add(InitEvent(context: context));
    super.initState();
  }

  late QrBloc controller;
  @override
  Widget build(BuildContext context) {
    controller = BlocProvider.of<QrBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "الفحص بواسطة QR",
          style: TextStyle(
            color: kSecColor,
          ),
        ),
      ),
      body: const Column(
        children: [
          Spacer(),
          QrCheckTitle(),
          QrCheckIconButton(),
          Spacer(),
          QrCheckButton(),
        ],
      ),
    );
  }
}
