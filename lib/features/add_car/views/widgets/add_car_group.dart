import 'package:flutter/material.dart';

import '../../../../controllers/car/addcar/addcar_bloc.dart';
import '../../../../core/consts.dart';

class AddCarGroup extends StatelessWidget {
  const AddCarGroup({super.key, required this.controller});
  final AddCarBloc controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            controller.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          subtitle: Text(
            controller.isNumber ? "الرقم" : "رمز QR",
          ),
          trailing: Icon(
            size: 50,
            controller.isNumber
                ? Icons.onetwothree_rounded
                : Icons.qr_code_rounded,
          ),
        ),
        TextField(
          controller: controller.valueController,
          decoration: InputDecoration(
            label: Text(controller.isNumber ? "رمز QR" : "الرقم"),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(
              controller.isNumber
                  ? Icons.qr_code_rounded
                  : Icons.onetwothree_rounded,
            ),
            suffixIcon: !controller.isNumber
                ? IconButton(
                    onPressed: () {
                      controller.add(SearchNumber());
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.oldNumController,
          decoration: const InputDecoration(
            label: Text("الرقم السابق"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(
              Icons.repeat,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.kilo1Controller,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          decoration: const InputDecoration(
            label: Text("رقم الكيلو"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(Icons.speed_outlined),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.plateController,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          decoration: const InputDecoration(
            label: Text("رقم اللوحة"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(Icons.directions_car_outlined),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.modelController,
          decoration: const InputDecoration(
            label: Text("الموديل"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(Icons.directions_car_outlined),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.yCarController,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          decoration: const InputDecoration(
            label: Text("سنة موديل السيارة"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(
              Icons.calendar_month,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.colorController,
          decoration: const InputDecoration(
            label: Text("لون السيارة"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(
              Icons.color_lens,
            ),
          ),
        ),
      ],
    );
  }
}
