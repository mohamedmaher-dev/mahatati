part of 'num_bloc.dart';

@immutable
sealed class NumEvent {}

final class BackClickEvent extends NumEvent {
  final BuildContext context;
  BackClickEvent({required this.context});
}

final class CheckClickEvent extends NumEvent {
  final BuildContext context;
  CheckClickEvent({required this.context});
}

final class InitEvent extends NumEvent {
  final BuildContext context;
  InitEvent({required this.context});
}
