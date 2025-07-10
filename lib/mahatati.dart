import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahatati/core/localization/generated/l10n.dart';
import 'features/add_car/views/add_car_view.dart';
import 'features/auth/presentation/views/auth_view.dart';
import 'features/car_details/views/car_details_view.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/num_check/views/num_check_view.dart';
import 'features/qr_check/views/qr_check_view.dart';
import 'features/qr_check/views/widgets/scann_qr_view.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'features/update_car/views/update_car_view.dart';
import 'features/update_car/views/widgets/images_viewer.dart';

class Mahatati extends StatefulWidget {
  const Mahatati({super.key});

  @override
  State<Mahatati> createState() => _MahatatiState();
}

class _MahatatiState extends State<Mahatati> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashView(),
      routes: {
        "login": (context) => const LoginView(),
        "home": (context) => const HomeView(),
        "checknum": (context) => const CheckNum(),
        "checkqr": (context) => const QRView(),
        "updatecar": (context) => const UpdateCarView(),
        "addcar": (context) => const AddCarView(),
        "imagesview": (context) => const ImagesViewer(),
        "scann": (context) => const ScannQRView(),
        "details": (context) => const CarDetailsView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.almaraiTextTheme(),
        primarySwatch: Colors.deepPurple,
      ),
      localizationsDelegates: const [
        Language.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Language.delegate.supportedLocales,
      locale: const Locale("ar"),
      builder: EasyLoading.init(),
    );
  }
}
