part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

final class InitEvent extends SplashEvent {
  final BuildContext context;
  InitEvent({required this.context});
}
