import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/updatecar/updatecar_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mahatati/features/update_car/views/widgets/update_car_group.dart';
import 'package:mahatati/features/update_car/views/widgets/update_material_group.dart';
import 'package:mahatati/features/update_car/views/widgets/update_owner_group.dart';
import 'package:mahatati/features/update_car/views/widgets/update_car_bottom.dart';

class UpdateCarView extends StatefulWidget {
  const UpdateCarView({super.key});

  @override
  State<UpdateCarView> createState() => _AddDataViewState();
}

class _AddDataViewState extends State<UpdateCarView> {
  @override
  void initState() {
    BlocProvider.of<UpdateCarBloc>(context)
        .add(InitUpdateCarEvent(context: context));
    super.initState();
  }

  late UpdateCarBloc controller;
  @override
  Widget build(BuildContext context) {
    controller = BlocProvider.of<UpdateCarBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "تحديث البيانات",
        ),
        actions: [
          IconButton(
            color: kSecColor,
            icon: const Icon(Icons.image),
            onPressed: () {
              controller.add(ShowImagesClickEvent(context: context));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  UpdateCarGroup(controller: controller),
                  UpdateOwnerGroup(controller: controller),
                  UpdateMaterialGroup(controller: controller),
                ],
              ),
            ),
          ),
          UpdateCarBottom(controller: controller),
        ],
      ),
    );
  }
}
