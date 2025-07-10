part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class ChangeHidePass extends LoginEvent {}

final class ChangeRememberMe extends LoginEvent {}

final class LoginClickEvent extends LoginEvent {
  final BuildContext context;
  LoginClickEvent({required this.context});
}

final class StationSelectedEvent extends LoginEvent {
  final BuildContext context;
  final String station;
  StationSelectedEvent({required this.context, required this.station});
}
