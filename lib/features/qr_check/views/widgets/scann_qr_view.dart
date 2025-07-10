import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/check/qr/qr_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannQRView extends StatefulWidget {
  const ScannQRView({super.key});

  @override
  State<ScannQRView> createState() => _ScannQRViewState();
}

class _ScannQRViewState extends State<ScannQRView> {
  late QrBloc controller;
  @override
  Widget build(BuildContext context) {
    controller = BlocProvider.of<QrBloc>(context);
    MobileScannerController cameraController =
        MobileScannerController(detectionTimeoutMs: 1000);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () => cameraController.toggleTorch(),
        child: ValueListenableBuilder(
          valueListenable: cameraController.torchState,
          builder: (context, state, child) {
            switch (state) {
              case TorchState.off:
                return const Icon(Icons.flash_off);
              case TorchState.on:
                return const Icon(Icons.flash_on);
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(kValueRound),
          ),
          child: MobileScanner(
            fit: BoxFit.fill,
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                controller.add(
                  DetectedQREvent(qrValue: barcode.rawValue!, context: context),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
