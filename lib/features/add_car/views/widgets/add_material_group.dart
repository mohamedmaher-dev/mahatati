import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/car/addcar/addcar_bloc.dart';
import '../../../../core/consts.dart';
import 'group_item.dart';

class AddMaterialGroup extends StatelessWidget {
  const AddMaterialGroup({super.key, required this.controller});
  final AddCarBloc controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCarBloc, AddCarState>(
      builder: (context, state) {
        return GroupItem(
          title: "المادة و الكميات",
          subtitle: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.oil_barrel_rounded),
                title: Text(
                  controller.materialSelected ?? "اختر نوع المادة",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("نوع المادة"),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  color: kPrimaryColor,
                  onPressed: () {
                    controller.add(GetMaterilaAddEvent(context: context));
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.gas_meter_rounded),
                title: Text(
                  controller.quantsSelected ?? "اختر كمية المادة",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("كمية المادة"),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  color: kPrimaryColor,
                  onPressed: () {
                    controller.add(GetQuantsAddEvent(context: context));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
