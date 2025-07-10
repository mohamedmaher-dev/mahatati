import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mahatati/features/home/presentation/views/widgets/home_button_view.dart';
import 'package:mahatati/features/home/presentation/views/widgets/home_title_view.dart';

import '../controllers/home_bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    HomeBloc controller = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "الصفحة الرئيسية",
          style: TextStyle(
            color: kSecColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            const HomeTitleView(),
            HomeButtonView(
                icon: Icons.onetwothree_rounded,
                onPressed: () {
                  controller.add(CheckNumClickEvent(context: context));
                }),
            const SizedBox(height: 20),
            HomeButtonView(
                icon: Icons.qr_code_rounded,
                onPressed: () {
                  controller.add(CheckQRClickEvent(context: context));
                })
          ],
        ),
      ),
    );
  }
}
