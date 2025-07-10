import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/details/details_bloc.dart';
import 'widgets/car_details_body.dart';
import 'widgets/car_details_bottom.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    DetailsBloc controller = BlocProvider.of<DetailsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("بيانات السيارة"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          CarDetailsBody(controller: controller),
          const Spacer(),
          const CarDetailsBottom(),
        ],
      ),
    );
  }
}
