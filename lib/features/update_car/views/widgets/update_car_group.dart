import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/widgets/car_details_item.dart';
import 'package:mahatati/features/update_car/views/widgets/add_kilo2_dialog.dart';

import '../../../../controllers/car/updatecar/updatecar_bloc.dart';
import '../../../../core/consts.dart';

class UpdateCarGroup extends StatelessWidget {
  const UpdateCarGroup({super.key, required this.controller});
  final UpdateCarBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "السيارة",
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: [
          CarDetailsItem(
            title: controller.carModel.number,
            subtitle: "الرقم",
            trailing: IconButton(
              onPressed: () {
                controller.add(CopyNumberEvent());
              },
              icon: const Icon(
                Icons.copy,
                color: kPrimaryColor,
              ),
            ),
          ),
          CarDetailsItem(
            title: controller.carModel.qr,
            subtitle: "رمز QR",
          ),
          CarDetailsItem(
            title: controller.carModel.oldNum,
            subtitle: "الرقم السابق",
          ),
          CarDetailsItem(
            title: controller.carModel.kilo1,
            subtitle: "رقم الكيلو (1)",
          ),
          BlocBuilder<UpdateCarBloc, UpdateCarState>(
            builder: (context, state) {
              return CarDetailsItem(
                title: controller.kilo2 == null
                    ? "قم بكتابة رقم الكيلو"
                    : "رقم الكيلو : ${controller.kilo2}",
                subtitle: "رقم الكيلو (2)",
                trailing: IconButton(
                  color: kPrimaryColor,
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddKilo2Dialog(controller: controller);
                      },
                    );
                  },
                ),
              );
            },
          ),
          CarDetailsItem(
            title: controller.carModel.plate,
            subtitle: "رقم اللوحة",
          ),
          CarDetailsItem(
            title: controller.carModel.model,
            subtitle: "الموديل",
          ),
          CarDetailsItem(
            title: controller.carModel.yCar,
            subtitle: "سنة موديل السيارة",
          ),
          CarDetailsItem(
            title: controller.carModel.color,
            subtitle: "لون السيارة",
          ),
        ],
      ),
    );
  }
}
