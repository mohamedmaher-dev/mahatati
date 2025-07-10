import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/check/qr/qr_bloc.dart';
import '../../../../core/consts.dart';

class QrCheckIconButton extends StatelessWidget {
  const QrCheckIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    QrBloc controller = BlocProvider.of<QrBloc>(context);

    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        controller.add(StartScannQREvent(context: context));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        padding: const EdgeInsets.all(10),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: kPrimaryColor,
          radius: const Radius.circular(kValueRound),
          strokeWidth: 2,
          dashPattern: const [10, 10],
          child: const Icon(
            Icons.qr_code_rounded,
            color: kPrimaryColor,
            size: 250,
          ),
        ),
      ),
    );
  }
}
