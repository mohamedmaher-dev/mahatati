part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

final class InitDetailsEvent extends DetailsEvent {
  final BuildContext context;
  InitDetailsEvent({required this.context});
}
