import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/widgets/app_icon_view.dart';
import 'package:mahatati/features/splash/presentation/views/widgets/buttom_view.dart';
import 'package:mahatati/features/splash/presentation/views/widgets/top_view.dart';
import '../controller/splash_bloc/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(InitEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            TopView(),
            Spacer(),
            AppIconView(),
            Spacer(),
            ButtomView(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
