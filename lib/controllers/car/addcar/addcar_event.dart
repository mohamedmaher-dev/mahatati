part of 'addcar_bloc.dart';

@immutable
sealed class AddCarEvent {}

final class InitAddCarEvent extends AddCarEvent {
  final BuildContext context;

  final bool isNumber;
  final String value;
  InitAddCarEvent(
      {required this.isNumber, required this.value, required this.context});
}

final class GetCitiesEvent extends AddCarEvent {
  final BuildContext context;
  GetCitiesEvent({required this.context});
}

final class SelectCityEvent extends AddCarEvent {
  final BuildContext context;
  final String city;
  SelectCityEvent({required this.context, required this.city});
}

class GetMaterilaAddEvent extends AddCarEvent {
  final BuildContext context;
  GetMaterilaAddEvent({required this.context});
}

class MaterialSelectedAddEvent extends AddCarEvent {
  final BuildContext context;
  final String materialSelected;
  MaterialSelectedAddEvent({
    required this.context,
    required this.materialSelected,
  });
}

class GetQuantsAddEvent extends AddCarEvent {
  final BuildContext context;
  GetQuantsAddEvent({required this.context});
}

class QuantsSelectedAddEvent extends AddCarEvent {
  final BuildContext context;
  final String quantsSelected;
  QuantsSelectedAddEvent({required this.context, required this.quantsSelected});
}

class AddImageEvent extends AddCarEvent {
  final BuildContext context;
  AddImageEvent({required this.context});
}

class DeleteImageEvent extends AddCarEvent {
  final BuildContext context;
  final int index;
  DeleteImageEvent({required this.context, required this.index});
}

class BackClickEvent extends AddCarEvent {
  final BuildContext context;
  BackClickEvent({required this.context});
}

class AddEvent extends AddCarEvent {
  final BuildContext context;
  AddEvent({required this.context});
}

class SearchNumber extends AddCarEvent {}
