import 'package:flutter/material.dart';
import 'package:mahatati/controllers/details/details_bloc.dart';

import '../../../../core/components/format_date.dart';
import '../../../../core/widgets/car_details_item.dart';

class CarDetailsBody extends StatelessWidget {
  const CarDetailsBody({super.key, required this.controller});
  final DetailsBloc controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      children: [
        CarDetailsItem(
          title: controller.carModel.number,
          subtitle: "رقم السيارة",
        ),
        CarDetailsItem(
          title: controller.userModel.userStation,
          subtitle: "رقم المحطة",
        ),
        CarDetailsItem(
          title: controller.userModel.userName,
          subtitle: "اسم المستخدم",
        ),
        CarDetailsItem(
          title: FormatDate(date: controller.carModel.updatedAt!).formatDate(),
          subtitle: "التاريخ السابق",
        ),
        CarDetailsItem(
          title: controller.carModel.kilo1,
          subtitle: "الكيلو السابق",
        ),
      ],
    );
  }
}
