part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class CheckNumClickEvent extends HomeEvent {
  final BuildContext context;
  CheckNumClickEvent({required this.context});
}

final class CheckQRClickEvent extends HomeEvent {
  final BuildContext context;
  CheckQRClickEvent({required this.context});
}
