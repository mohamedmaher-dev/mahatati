import 'package:flutter/material.dart';
import 'package:mahatati/core/widgets/car_details_item.dart';

import '../../../../controllers/car/updatecar/updatecar_bloc.dart';
import '../../../../core/components/format_date.dart';
import '../../../../core/consts.dart';

class UpdateOwnerGroup extends StatelessWidget {
  const UpdateOwnerGroup({super.key, required this.controller});
  final UpdateCarBloc controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "المالك",
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: [
          CarDetailsItem(
            title: controller.carModel.owner,
            subtitle: "اسم المالك",
          ),
          CarDetailsItem(
            title: controller.carModel.iden,
            subtitle: "رقم الهوية",
          ),
          CarDetailsItem(
            title: controller.carModel.mob,
            subtitle: "رقم الموبايل",
          ),
          CarDetailsItem(
              title:
                  FormatDate(date: controller.carModel.updatedAt!).formatDate(),
              subtitle: "اخر تحديث"),
          CarDetailsItem(title: controller.carModel.notes, subtitle: "ملاحظه"),
        ],
      ),
    );
  }
}
