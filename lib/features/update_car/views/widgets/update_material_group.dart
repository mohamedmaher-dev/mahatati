import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/widgets/car_details_item.dart';

import '../../../../controllers/car/updatecar/updatecar_bloc.dart';
import '../../../../core/consts.dart';

class UpdateMaterialGroup extends StatelessWidget {
  const UpdateMaterialGroup({super.key, required this.controller});
  final UpdateCarBloc controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCarBloc, UpdateCarState>(
      builder: (context, state) {
        return ListTile(
          title: const Text(
            "المواد و الكميات",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            children: [
              CarDetailsItem(
                title: controller.materialSelected == null
                    ? "اختر نوع المادة"
                    : "المادة المختارة : ${controller.materialSelected}",
                subtitle: "نوع المادة",
                trailing: IconButton(
                  color: kPrimaryColor,
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  onPressed: () {
                    controller.add(GetMaterilaUpdateEvent(context: context));
                  },
                ),
              ),
              CarDetailsItem(
                title: controller.quantsSelected == null
                    ? "اختر الكمية"
                    : "الكمية المختارة : ${controller.quantsSelected}",
                subtitle: "كمية المادة",
                trailing: IconButton(
                  color: kPrimaryColor,
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  onPressed: () {
                    controller.add(GetQuantsUpdateEvent(context: context));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
