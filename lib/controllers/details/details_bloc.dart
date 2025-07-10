import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mahatati/models/car_model.dart';
import 'package:mahatati/models/user_model.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  late CarModel carModel;
  late UserModel userModel;
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsEvent>(
      (event, emit) {
        // TODO: implement event handler
      },
    );
  }
}
