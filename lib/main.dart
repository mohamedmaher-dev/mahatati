import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/addcar/addcar_bloc.dart';
import 'package:mahatati/controllers/car/updatecar/updatecar_bloc.dart';
import 'package:mahatati/controllers/check/num/num_bloc.dart';
import 'package:mahatati/controllers/check/qr/qr_bloc.dart';
import 'package:mahatati/controllers/details/details_bloc.dart';
import 'package:mahatati/firebase_options.dart';
import 'core/utils/fcm_manger.dart';
import 'features/auth/presentation/views/view_models/login/login_bloc.dart';
import 'features/home/presentation/controllers/home_bloc/home_bloc.dart';
import 'features/splash/presentation/controller/splash_bloc/splash_bloc.dart';
import 'mahatati.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FCMManger.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => NumBloc(),
        ),
        BlocProvider(
          create: (context) => QrBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateCarBloc(),
        ),
        BlocProvider(
          create: (context) => AddCarBloc(),
        ),
        BlocProvider(
          create: (context) => DetailsBloc(),
        ),
      ],
      child: const Mahatati(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
