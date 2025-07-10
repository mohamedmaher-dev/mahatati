part of 'updatecar_bloc.dart';

@immutable
sealed class UpdateCarEvent {}

class InitUpdateCarEvent extends UpdateCarEvent {
  final BuildContext context;
  InitUpdateCarEvent({required this.context});
}

class UpdateClickEvent extends UpdateCarEvent {
  final BuildContext context;
  UpdateClickEvent({required this.context});
}

class BackClickEvent extends UpdateCarEvent {
  final BuildContext context;
  BackClickEvent({required this.context});
}

class ShowImagesClickEvent extends UpdateCarEvent {
  final BuildContext context;
  ShowImagesClickEvent({required this.context});
}

class GetMaterilaUpdateEvent extends UpdateCarEvent {
  final BuildContext context;
  GetMaterilaUpdateEvent({required this.context});
}

class MaterialSelectedUpdateEvent extends UpdateCarEvent {
  final BuildContext context;
  final String materialSelected;
  MaterialSelectedUpdateEvent(
      {required this.context, required this.materialSelected});
}

class GetQuantsUpdateEvent extends UpdateCarEvent {
  final BuildContext context;
  GetQuantsUpdateEvent({required this.context});
}

class QuantsSelectedUpdateEvent extends UpdateCarEvent {
  final BuildContext context;
  final String quantsSelected;
  QuantsSelectedUpdateEvent(
      {required this.context, required this.quantsSelected});
}

class Kilo2SelectedEvent extends UpdateCarEvent {
  final BuildContext context;
  Kilo2SelectedEvent({required this.context});
}

class SlideImageEvent extends UpdateCarEvent {
  final int index;
  SlideImageEvent({required this.index});
}

final class CopyNumberEvent extends UpdateCarEvent {}
