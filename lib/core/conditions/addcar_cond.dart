import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/addcar/addcar_bloc.dart';

class AddCarCond {
  final BuildContext context;
  final bool isNumber;
  const AddCarCond({required this.context, required this.isNumber});
  Map cond() {
    AddCarBloc controller = BlocProvider.of<AddCarBloc>(context);
    if (controller.valueController.text.isEmpty) {
      return {
        "cond": false,
        "msg": isNumber ? "يجب ادخال رمز QR" : "يجب ادخال الرقم"
      };
    }
    if (controller.kilo1Controller.text.isEmpty) {
      return {
        "cond": false,
        "msg": "يجب ادخل رقم الكيلو",
      };
    }
    if (controller.quantsSelected == null) {
      return {
        "cond": false,
        "msg": "يجب تحديد كمية المادة",
      };
    }
    if (controller.citySelected == null) {
      return {
        "cond": false,
        "msg": "يجب اختيار المدينة",
      };
    }
    return {"cond": true, "msg": "All Done"};
  }
}
