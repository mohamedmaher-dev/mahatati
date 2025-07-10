// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mahatati/features/splash/data/rebository/rebos/splash_remote_rebo.dart';
import 'package:mahatati/features/splash/data/rebository/splash_rebo.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashRebo splashRebo = SplashRemoteRebo();
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>(
      (event, emit) {
        switch (event) {
          case InitEvent():
            {
              initMethod(event);
            }
            break;
        }
      },
    );
  }

  void initMethod(InitEvent event) {
    splashRebo.navigateToHome(context: event.context);
  }
}
