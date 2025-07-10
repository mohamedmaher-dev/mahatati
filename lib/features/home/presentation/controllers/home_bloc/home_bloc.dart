// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mahatati/features/home/data/rebository/home_rebo.dart';
import 'package:mahatati/features/home/data/rebository/rebos/home_remote_rebo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRebo homeRebo = HomeRemoteRebo();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(
      (event, emit) {
        switch (event) {
          case CheckNumClickEvent():
            {
              homeRebo.navigateToCheckNum(context: event.context);
            }
            break;
          case CheckQRClickEvent():
            {
              homeRebo.navigateToCheckQR(context: event.context);
            }
            break;
        }
      },
    );
  }
}
