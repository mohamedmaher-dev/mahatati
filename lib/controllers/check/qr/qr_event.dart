part of 'qr_bloc.dart';

@immutable
sealed class QrEvent {}

final class InitEvent extends QrEvent {
  final BuildContext context;
  InitEvent({required this.context});
}

final class BackClickEvent extends QrEvent {
  final BuildContext context;
  BackClickEvent({required this.context});
}

final class StartScannQREvent extends QrEvent {
  final BuildContext context;
  StartScannQREvent({required this.context});
}

final class DetectedQREvent extends QrEvent {
  final BuildContext context;
  final String qrValue;
  DetectedQREvent({required this.qrValue, required this.context});
}
